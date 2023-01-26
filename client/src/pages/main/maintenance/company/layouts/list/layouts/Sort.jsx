// Libraries
import { useContext } from "react";
import { Stack, Typography } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowDownAZ, faArrowDownZA } from "@fortawesome/free-solid-svg-icons";

// Core
import { GlobalCntx } from "core/context/Global"; // Context

// Constants
const asc = {
    padding: '3px 10px',
    borderRadius: '5px',
    fontSize: '110%',
    color: '#959595',
    transition: 'all 0.2s ease-in-out',
    cursor: 'pointer',
    '&:hover': { backgroundColor: '#E5E5E5' }
}

const desc = {
    padding: '3px 10px',
    borderRadius: '5px',
    fontSize: '110%',
    color: '#959595',
    backgroundColor: '#E5E5E5',
    cursor: 'pointer'
}

const Sort = () => {
    const { category, setCategory } = useContext(GlobalCntx);

    return (
        <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" spacing= { 1 }>
            { category === 'asc' ? <Typography sx= { asc }><FontAwesomeIcon icon= { faArrowDownAZ } onClick= { () => setCategory('desc') } /></Typography> :
                <Typography sx= { desc }><FontAwesomeIcon icon= { faArrowDownZA } onClick= { () => setCategory('asc') } /></Typography>}
        </Stack>
    );
}

export default Sort;