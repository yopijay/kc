// Libraries
import React from 'react';
import { createRoot } from 'react-dom/client';
import { ThemeProvider } from '@emotion/react';
import { CssBaseline } from '@mui/material';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

// Assets
import 'assets/font/font.css';
import 'assets/css/global.css';
import 'assets/css/scrollbar.css';

// Layouts
import App from './App';

// Theme
import { Light } from 'core/theme/mode.theme';

const container = document.getElementById('root');
const root = createRoot(container);

root.render(
    <React.StrictMode>
        <CssBaseline />
        <ThemeProvider theme= { Light }>
            <App />
            <ToastContainer />
        </ThemeProvider>
    </React.StrictMode>
);