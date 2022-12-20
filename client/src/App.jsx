// Libraries
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { QueryClient, QueryClientProvider } from 'react-query';

// Layouts
import Account from 'pages/account';
import Main from 'pages/main';

const App = () => { 
    const client = new QueryClient();
    
    return ( 
        <Router>
            <QueryClientProvider client= { client }>
                <Routes><Route path= "/*" element= { localStorage.getItem('token') ? <Main /> : <Account /> } /></Routes>
            </QueryClientProvider>
        </Router> 
    ); 
}

export default App;