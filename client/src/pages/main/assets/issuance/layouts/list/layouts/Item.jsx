// Libraries
import { Box, Stack, Typography } from "@mui/material";
import { useContext } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEye, faPencil } from "@fortawesome/free-solid-svg-icons";
import { Link } from "react-router-dom";

// Core
import { ListCntxt } from "core/context/List"; // Context

// Constants
import { container, empty, icons, item, txt, txttitle } from "../index.style"; // Styles

const Item = () => {
    const { list } = useContext(ListCntxt);

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= { container }>
            { list.length > 0 ?
                list?.map((data, index) => (
                    <Stack direction= "row" justifyContent= "space-between" alignItems= "center" key= { index } sx= { item } spacing= { 2 }>
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "flex-start" sx= {{ flexGrow: 1, overflow: 'hidden' }}>
                            <Typography variant= "body2" sx= { txt }>#{ data.series_no }</Typography>
                            <Typography variant= "body1" sx= { txttitle }>{ data.issued_to }</Typography>
                            <Typography variant= "body2" sx= { txt }>{ data.category } - { data.sub_category }</Typography>
                            <Typography variant= "body2" sx= { txt }>Date issued: { data.date_created }</Typography>
                        </Stack>
                        <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 2 }>
                            { data.status === 1 ? <Box sx= {{ width: '10px', height: '10px', backgroundColor: '#7D8F69', borderRadius: '20px' }} /> : 
                                <Box sx= {{ width: '10px', height: '10px', backgroundColor: '#EF9F9F', borderRadius: '20px' }} /> }
                            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                                <Typography sx= { icons } component= { Link } to= { `/assets/asset-issuance/form/update/${data.id}` }><FontAwesomeIcon icon= { faPencil } size= "lg" /></Typography>
                                <Typography sx= { icons } component= { Link } to= { `/assets/asset-issuance/form/view/${data.id}` }><FontAwesomeIcon icon= { faEye } size= "lg" /></Typography>
                            </Stack>
                        </Stack>
                    </Stack>
                )) :
                <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= { empty }>
                    <Typography>No record/s found!</Typography>
                </Stack> }
        </Stack>
    );
}

export default Item;