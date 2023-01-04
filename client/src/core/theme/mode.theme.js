// Libraries
import { createTheme } from "@mui/material";

export const Light = createTheme({
    palette: {
        primary: {
            main: '#81C6E8',
            light: '#7DE5ED',
            dark: '#5DA7DB',
            contrastText: '#5837D0'
        },
        secondary: {
            main: '#8D72E1',
            light: '#8D9EFF',
            dark: '#6C4AB6',
            contrastText: '#B9E0FF'
        },
        error: {
            main: '#EF9F9F',
            light: '#FAD4D4',
            dark: '#F47C7C',
            contrastText: '#FFF2F2'
        },
        warning: {
            main: '#F0E161',
            light: '#FFF38C',
            dark: '#D9CB50',
            contrastText: '#C0B236'
        },
        info: {
            main: '#624F82',
            light: '#9F73AB',
            dark: '#3F3B6C',
            contrastText: '#A3C7D6'
        },
        success: {
            main: '#7D8F69',
            light: '#A9AF7E',
            dark: '#557153',
            contrastText: '#E6E5A3'
        },
        excel: { main: '#61764B' },
        pdf: { main: '#DD5353' },
        text: {
            primary: '#434242',
            secondary: '#222222',
            disabled: '#bdc3c7'
        }
    },
    typography: {
        fontFamily: [ '-apple-system', 'Gilroy Light' ],
        fontSize: 13
    },
    components: {
        MuiInput: {
            styleOverrides: {
                root: {
                    '&:before': { borderBottom: 'none' },
                    '&:after': { borderBottom: 'none' },
                    '&.Mui-disabled:before': { borderBottom: 'none' },
                    '&:hover:not(.Mui-disabled):before': { borderBottom: 'none' }
                }
            }
        }
    }
});