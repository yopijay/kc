// Libraries
import { createTheme } from "@mui/material";

export const Light = createTheme({
    palette: {
        primary: {
            main: '#1976D2',
            light: '#2196F3',
            dark: '#0D47A1',
            contrastText: '#E3F2FD'
        },
        secondary: {
            main: '#0288D1',
            light: '#03A9F4',
            dark: '#01579B',
            contrastText: '#E1F5FE'
        },
        error: {
            main: '#D32F2F',
            light: '#F44336',
            dark: '#B71C1C',
            contrastText: '#FFEBEE'
        },
        warning: {
            main: '#F57C00',
            light: '#FF9800',
            dark: '#E65100',
            contrastText: '#FFF3E0'
        },
        info: {
            main: '#0097A7',
            light: '#00BCD4',
            dark: '#006064',
            contrastText: '#E0F2F1'
        },
        success: {
            main: '#388E3C',
            light: '#4CAF50',
            dark: '#1B5E20',
            contrastText: '#E8F5E9'
        },
        excel: { main: '#61764B' },
        pdf: { main: '#DD5353' },
        text: {
            primary: '#212121',
            secondary: '#424242',
            disabled: '#9E9E9E'
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