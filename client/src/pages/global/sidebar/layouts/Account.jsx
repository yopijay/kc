// Libraries
import { faEllipsisVertical } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Avatar, Stack, Typography } from "@mui/material";
import { useContext } from "react";

// Core
import { ProfileCntx } from "core/context/Profile"; // Context

const Account = () => {
    const { data } = useContext(ProfileCntx);

    return (
        <Stack direction= "row" justifyContent= "space-between" alignItems= "center">
            <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                <Avatar />
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                    <Typography variant= "body1">{ data.lname }, { data.fname } { data.mname }</Typography>
                    <Typography variant= "button">{ data.user_level }</Typography>
                </Stack>
            </Stack>
            <FontAwesomeIcon icon= { faEllipsisVertical } />
        </Stack>
    );
}

export default Account;