// Libraries
import { Stack, Typography } from "@mui/material";
import { useContext } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faChartPie, faClipboardList, faEye, faPencil } from "@fortawesome/free-solid-svg-icons";
import { Link } from "react-router-dom";

// Core
import { ListCntxt } from "core/context/List"; // Context

// Custom styles
const icons = {
    color: 'rgb(99, 115, 129)',
    padding: '3px',
    lineHeight: 0,
    transition: 'transform .2s',
    '&:hover': { 
        transform: 'scale(1.1)',
        transition: 'transform .2s'
    }
}

const item = {
    backgroundColor: '#FFFFFF',
    padding: '10px 20px',
    border: 'solid 1px #F3F3F3',
    borderRadius: '10px',
    overflow: 'hidden'
}

const label = {
    whiteSpace: 'nowrap',
    overflow: 'hidden',
    textOverflow: 'ellipsis',
    width: '100%'
}

const Item = ({ sub, fetching, profile }) => {
    const { list } = useContext(ListCntxt);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= {{ padding: '0 0 40px 0', overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
            { list.length > 0 ?
                list?.map((data, index) => (
                    <Stack direction= "row" justifyContent= "space-between" alignItems= "center" key= { index } sx= { item } spacing= { 2 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= {{ flexGrow: 1, overflow: 'hidden' }}>
                            <Typography variant= "body1" sx= { label } style= {{ fontWeight: 'bold' }}>{ (data.type).toUpperCase() } COUNT</Typography>
                            <Typography variant= "body2" sx= { label }>#{ data.series_no }</Typography>
                            <Typography variant= "body2" sx= { label }>Date: { data.date_from }{ data.date_from !== data.date_to ? ` to ${data.date_to}` : ''}</Typography>
                            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" sx= { label } spacing= { 1 }>
                                <Typography variant= "body2">Brands: </Typography>
                                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center">
                                    { (JSON.parse(data.brands)).length > 0 ?
                                        (JSON.parse(data.brands)).map((brd, index) => ( 
                                            <Typography key= { index } variant= "body2">{ index !== 0 ? ', ' : '' } { brd.brand_name }{ `(${brd.items})` }</Typography>)) :
                                        <Typography variant= "body2">ALL{ `(${data.total_items})` }</Typography> }
                                </Stack>
                            </Stack>
                            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" sx= { label } spacing= { 1 }>
                                <Typography variant= "body2">Branch: </Typography>
                                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center">
                                    { (JSON.parse(data.branch)).map((brc, index) => ( <Typography key= { index } variant= "body2">{ index !== 0 ? ', ' : '' } { brc.name }</Typography>)) }
                                </Stack>
                            </Stack>
                        </Stack>
                        <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 }>
                            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                                { !(((parseInt((new Date(data.date_from)).getDate()) - parseInt((new Date()).getDate())) < 0) &&
                                    ((parseInt((new Date(data.date_to)).getDate()) - parseInt((new Date()).getDate())) < 0)) ? 
                                        <Typography sx= { icons } component= { Link } to= { `/warehouse/physical-count/personnel/${data.id}` }>
                                            <FontAwesomeIcon icon= { faClipboardList } size= "lg" />
                                        </Typography> : '' }
                                { (parseInt((new Date(data.date_from)).getDate()) - parseInt((new Date()).getDate())) > 0 ? 
                                    !fetching && (JSON.parse(profile.permissions)?.[`module_${sub?.module_id}`][`submodule_${sub?.id}`]?.update || profile.user_level === 'superadmin') ? 
                                        <Typography sx= { icons } component= { Link } to= { `/warehouse/physical-count/form/update/${data.id}` }>
                                            <FontAwesomeIcon icon= { faPencil } size= "lg" />
                                        </Typography> : '' : '' }
                                <Typography sx= { icons } component= { Link } to= { `/warehouse/physical-count/report/${data.id}` }>
                                    <FontAwesomeIcon icon= { faChartPie } size= "lg" />
                                </Typography>
                                <Typography sx= { icons } component= { Link } to= { `/warehouse/physical-count/form/view/${data.id}` }>
                                    <FontAwesomeIcon icon= { faEye } size= "lg" />
                                </Typography>
                            </Stack>
                        </Stack>
                    </Stack>
                )) :
                <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#FFFFFF', padding: '10px', border: 'solid 1px #F3F3F3', borderRadius: '10px' }}>
                    <Typography>No record/s found!</Typography>
                </Stack> }
        </Stack>
    );
}

export default Item;