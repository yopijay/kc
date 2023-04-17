// Libraries
import { faGear, faRightFromBracket } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Avatar, Stack, Typography } from "@mui/material";
import { useContext } from "react";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { usePost } from "core/function/global"; // Function
import { logout } from "core/api"; // API

// Constants
const link = {
    color: '#636e72',
    backgroundColor: '#dfe6e9',
    padding: '10px',
    borderRadius: '7px',
    textDecoration: 'none',
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#c6cbcd' }
}

// const linkActive = {
//     color: '#636e72',
//     backgroundColor: '#c6cbcd',
//     padding: '10px',
//     textDecoration: 'none',
//     borderRadius: '7px',
//     transition: 'all 0.2s ease-in-out',
// }

const Account = () => {
    const { data } = useContext(ProfileCntx);
    const { mutate: signout } = usePost({ fetch: logout, onSuccess: data => { if(data.result === 'success') { localStorage.removeItem('token'); window.location.href = "/" } } });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ padding: { xs: '20px 10px', lg: '0' }, borderTop: 'dashed 1px #dfe6e9' }}>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%' }} spacing= { 1 }>
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center" sx= {{ overflow: 'hidden' }}>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 } sx= {{ width: '60%', overflow: 'hidden' }}>
                        <Avatar />
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%', overflow: 'hidden' }}>
                            <Typography sx= {{ whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', width: '100%' }}>{ data.lname }, { data.fname }</Typography>
                        </Stack>
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 } sx= {{ width: '30%' }}>
                        <Stack direction= "row" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= { link }><FontAwesomeIcon icon= { faGear } /></Stack>
                        <Stack direction= "row" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= { link } onClick= { () => signout({ id: atob(localStorage.getItem('token')) }) }>
                            <FontAwesomeIcon icon= { faRightFromBracket } />
                        </Stack>
                    </Stack>
                </Stack>
            </Stack>
        </Stack>
    );
}

export default Account;