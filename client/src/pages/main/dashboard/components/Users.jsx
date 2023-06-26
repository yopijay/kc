import { Stack, Typography } from "@mui/material";

const Users = () => {
    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
            <Typography variant= "h6" sx= {{ fontWeight: 'bold', fontFamily: 'Gilroy Bold', color: '#474747' }}>Users</Typography>
        </Stack>
    );
}

export default Users;