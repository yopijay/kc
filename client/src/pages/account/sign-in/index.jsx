// Libraries
import { Container, Stack, TextField, Typography } from "@mui/material";
import { useForm } from "react-hook-form";
import { Link } from "react-router-dom";
import { yupResolver } from '@hookform/resolvers/yup';

// Core
import { usePost } from "core/function/global"; // Functions
import { authentication } from "core/api"; // APIs

// Constants
import { btn, input, link, title } from "./index.style"; // Styles
import { Validation } from "./index.validation"; // Validations

const Index = () => {
    const { register, handleSubmit, formState: { errors }, setError } = useForm({ resolver: yupResolver(Validation()) });
    const { mutate: signin } = usePost({ fetch: authentication, onSuccess: (data) => {
        if(data.result === 'error') { (data.error).forEach((err, index) => { setError(err.name, { type: index === 0 ? 'focus' : '', message: err.message }, { shouldFocus: index === 0}); }); }
        else { localStorage.setItem('token', data.message.id); window.location.href = '/'; }
    }});
    
    return (
        <Container maxWidth= "xs">
            <Stack direction= "row" justifyContent= "center" alignItems= "center" sx= {{ height: '100vh' }}>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" sx= {{ width: '100%' }} spacing= { 4 }>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                        <Stack direction= "row" justifyContent= "flex-start" alignItems= "center" spacing= { 1 }>
                            <Typography variant= "body2" sx= { title }>Sign in to</Typography>
                            <Typography variant= "body2" sx= { title } color= "error.dark">KC</Typography>
                        </Stack>
                        <Typography variant= "body2">Enter your details below.</Typography>
                    </Stack>
                    <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                        <form autoComplete= "off">
                            <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                    <Typography variant= "body1" sx= {{ fontSize: { xs: '.90rem', md: '.95rem' }, transition: 'all 0.2s ease-in-out' }}>Email</Typography>
                                    <TextField { ...register('email') } name= "email" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } />
                                    <Typography variant= "caption" color= "error.main" sx= {{ fontWeight: 'bold', textAlign: 'right', marginTop: '2px' }}>{ errors?.email?.message }</Typography>
                                </Stack>
                                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
                                    <Typography variant= "body1" sx= {{ fontSize: { xs: '.90rem', md: '.95rem' }, transition: 'all 0.2s ease-in-out' }}>Password</Typography>
                                    <TextField { ...register('password') } name= "password" type= "password" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } />
                                    <Typography variant= "caption" color= "error.main" sx= {{ fontWeight: 'bold', textAlign: 'right', marginTop: '2px' }}>{ errors?.password?.message }</Typography>
                                </Stack>
                            </Stack>
                        </form>
                        <Stack direction= "row" justifyContent= "flex-end" alignItems= "center">
                            <Typography variant= "body1" color= "text.primary" component= { Link } to= "/forgot-password" sx= { link }>Forgot Password?</Typography>
                        </Stack>
                    </Stack>
                    <Typography variant= "body1" sx= { btn } onClick= { handleSubmit(data => { data['password'] = btoa(data.password); signin(data); } ) }>Sign in</Typography>
                </Stack>
            </Stack>
        </Container>
    );
}

export default Index;