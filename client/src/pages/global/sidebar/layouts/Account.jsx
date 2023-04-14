// Libraries
import { faCube, faCubes, faGear, faRightFromBracket, faUser } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Avatar, Grid, Stack, Typography } from "@mui/material";
import { useContext } from "react";
import { Link } from "react-router-dom";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context
import { GlobalCntx } from "core/context/Global"; // Context
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

const linkActive = {
    color: '#636e72',
    backgroundColor: '#c6cbcd',
    padding: '10px',
    textDecoration: 'none',
    borderRadius: '7px',
    transition: 'all 0.2s ease-in-out',
}

const Account = () => {
    const { data } = useContext(ProfileCntx);
    const { isActive, setActive, setOpen } = useContext(GlobalCntx);
    const { mutate: signout } = usePost({ fetch: logout, onSuccess: data => { if(data.result === 'success') { localStorage.removeItem('token'); window.location.href = "/" } } });

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ padding: { xs: '20px 10px', lg: '0' }, borderTop: 'dashed 1px #dfe6e9' }}>
            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%' }} spacing= { 1 }>
                {/* <Grid container direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                    { data.user_level === 'superadmin' ? <Grid item xs= { 3 }>
                        <Stack direction= "row" justifyContent= "center" alignItems= "center" spacing= { 2 } 
                            component= { Link } to= "/setup/module" sx= { isActive === 'module' ? linkActive : link }
                            onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'module'); setActive('module'); } }>
                            <FontAwesomeIcon icon= { faCube } />
                        </Stack>
                    </Grid> : '' }
                    { data.user_level === 'superadmin' ? <Grid item xs= { 3 }>
                        <Stack direction= "row" justifyContent= "center" alignItems= "center" spacing= { 2 } 
                            component= { Link } to= "/setup/submodule" sx= { isActive === 'submodule' ? linkActive : link }
                            onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'submodule'); setActive('submodule'); } }>
                            <FontAwesomeIcon icon= { faCubes } />
                        </Stack>
                    </Grid> : '' }
                    <Grid item xs= { 3 }>
                        <Stack direction= "row" justifyContent= "center" alignItems= "center" spacing= { 2 } 
                            component= { Link } to= "/maintenance/users" sx= { isActive === 'users' ? linkActive : link }
                            onClick= { () => { setOpen({ left: false}); localStorage.setItem('nav', 'users'); setActive('users'); } }>
                            <FontAwesomeIcon icon= { faUser } />
                        </Stack>
                    </Grid>
                    <Grid item xs= { 3 }>
                    </Grid>
                </Grid> */}
                <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                        <Avatar />
                        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch"><Typography>{ data.lname }, { data.fname }</Typography></Stack>
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                        <Stack direction= "row" justifyContent= "center" alignItems= "center" spacing= { 2 } sx= { link }>
                            <FontAwesomeIcon icon= { faGear } />
                        </Stack>
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