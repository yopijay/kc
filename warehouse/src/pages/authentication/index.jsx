// Libraries
import { Container, Stack, Typography } from "@mui/material";

// Core
import { useGet } from "core/function/global"; // Functions

// Constants
import { title } from "./index.style"; // Styles

const Index = () => {
    // const { data: sched } = useGet({ key: ['schedule'], fetch:})

    return (
        <Container maxWidth= "xs">
            <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= {{ height: '100vh' }}>
                <Stack direction= "column" justifyContent= "flfex-start" alignItems= "stretch" sx= {{ width: '100%' }} spacing= { 4 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                            <Typography variant= "body2" sx= { title }>Sign in to</Typography>
                            <Typography variant= "body2" color= "error.dark" sx= { title }>KC Warehouse</Typography>
                        </Stack>
                        <Typography variant= "body2">Enter your details below.</Typography>
                    </Stack>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <form autoComplete= "off">
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                </Stack>
                            </Stack>
                        </form>
                    </Stack>
                </Stack>
            </Stack>
        </Container>
    );
}

export default Index;