// Libraries
import { Box, Stack, Typography } from "@mui/material";
import { useContext } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEye, faPencil } from "@fortawesome/free-solid-svg-icons";
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

const Item = () => {
    const { list } = useContext(ListCntxt);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 2 } sx= {{ padding: '0 0 40px 0', overflowY: 'scroll', '&::-webkit-scrollbar': { display: 'none' } }}>
            { list.length > 0 ?
                    list?.map((data, index) => (
                        <Stack direction= "row" justifyContent= "space-between" alignItems= "center" key= { index } sx= { item } spacing= { 2 }>
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= {{ flexGrow: 1, overflow: 'hidden' }}>
                                <Typography variant= "body2" sx= {{ whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', width: '100%' }}>#{ data.series_no }</Typography>
                                <Typography variant= "body2" sx= {{ whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', width: '100%' }}>
                                    Location: <span style= {{ fontWeight: 'bold' }}>{ data.name }</span></Typography>
                            </Stack>
                            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 }>
                                { data.status === 1 ? <Box sx= {{ width: '10px', height: '10px', backgroundColor: '#7D8F69', borderRadius: '20px' }} /> : 
                                    <Box sx= {{ width: '10px', height: '10px', backgroundColor: '#EF9F9F', borderRadius: '20px' }} /> }
                                <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                                    <Typography sx= { icons } component= { Link } to= { `/maintenance/tracker/form/update/${data.id}` }>
                                        <FontAwesomeIcon icon= { faPencil } size= "lg" />
                                    </Typography>
                                    <Typography sx= { icons } component= { Link } to= { `/maintenance/tracker/form/view/${data.id}` }>
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