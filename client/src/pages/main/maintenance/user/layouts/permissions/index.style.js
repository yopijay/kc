import styled from "@emotion/styled"
import { Switch } from "@mui/material"

export const btnicon = {
    color: '#ffffff',
    backgroundColor: '#d1d1d1',
    borderRadius: '7px',
    padding: {
        xs: '5px 12px',
        md: '4px 10px'
    },
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#adadad' }
}

export const card = {
    padding: '30px 15px',
    flexGrow: 1,
    backgroundColor: '#ffffff',
    borderRadius: '8px',
    border: 'solid 1px #919eab40',
    overflowY: 'scroll',
    '&::-webkit-scrollbar': { display: 'none' }
}

export const btntxt = { 
    display: 'flex',
    cursor: 'pointer',
    flexDirection: 'row', 
    justifyContent: 'center', 
    alignItems: 'center',
    backgroundColor: '#204c6f',
    color: '#ffffff',
    borderRadius: '7px',
    padding: '7px 0',
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#1b405d' }
}

export const input = {
    border: 'solid 1px #ced6e0',
    padding: {
        xs: '10px 8px 8px 8px',
        md: '6px 10px 5px 10px'
    },
    borderRadius: '5px'
}

export const select = {
    width: '100%',
    border: 'solid 1px #dfe4ea',
    padding: {
        xs: '12px 8px 9px 8px',
        md: '9px 10px 6px 10px'
    },
    marginBottom: '5px',
    borderRadius: '5px'
}

export const date = {
    border: 'solid 1px #dfe4ea',
    padding: {
        xs: '12px 8px 9px 8px',
        md: '9px 10px 6px 10px'
    },
    marginBottom: '5px',
    borderRadius: '5px'
}

export const textarea = {
    border: 'solid 1px #ced6e0',
    borderRadius: '5px',
    fontFamily: 'Gilroy Light',
    fontSize: '105%',
    padding: '10px',
    outline: 'none',
    textTransform: 'uppercase',
    color: '#353b48'
}

export const label = {
    border: 'solid 1px #dfe4ea', 
    borderRadius: '5px', 
    height: '44px', 
    padding: '0 10px'
}

export const IOSSwitch = styled((props) => 
( <Switch focusVisibleClassName=".Mui-focusVisible" disableRipple {...props} /> )) (({ theme }) => (
    {
        width: 42,
        height: 26,
        padding: 0,
        '& .MuiSwitch-switchBase': {
            padding: 0,
            margin: 2,
            transitionDuration: '300ms',
            '&.Mui-checked': {
                transform: 'translateX(16px)',
                color: '#fff',
                '& + .MuiSwitch-track': { backgroundColor: theme.palette.mode === 'dark' ? '#2ECA45' : '#65C466', opacity: 1, border: 0, },
                '&.Mui-disabled + .MuiSwitch-track': { opacity: 0.5 },
            },
            '&.Mui-focusVisible .MuiSwitch-thumb': { color: '#33cf4d', border: '6px solid #fff', },
            '&.Mui-disabled .MuiSwitch-thumb': { color: theme.palette.mode === 'light' ? theme.palette.grey[100] : theme.palette.grey[600], },
            '&.Mui-disabled + .MuiSwitch-track': { opacity: theme.palette.mode === 'light' ? 0.7 : 0.3, },
        },
        '& .MuiSwitch-thumb': { boxSizing: 'border-box', width: 22, height: 22, },
        '& .MuiSwitch-track': {
            borderRadius: 26 / 2,
            backgroundColor: theme.palette.mode === 'light' ? '#E9E9EA' : '#39393D',
            opacity: 1,
            transition: theme.transitions.create(['background-color'], { duration: 500, }),
        }, 
    }
));