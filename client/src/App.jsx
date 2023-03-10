// Libraries
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { QueryClient, QueryClientProvider } from 'react-query';

// Core
import { ProfilePrvdr } from "core/context/Profile";
import { GlobalPrvdr } from "core/context/Global";

// Layouts
import Account from 'pages/account';
import Main from 'pages/main';

const App = () => {
    const client = new QueryClient();
    localStorage.setItem('nav', window.location.pathname === '/' ? 'home' : localStorage.getItem('nav'));
    
    return ( 
        <Router>
            <QueryClientProvider client= { client }>
                <GlobalPrvdr><Routes><Route path= "*" element= { localStorage.getItem('token') ? <ProfilePrvdr><Main /></ProfilePrvdr> : <Account /> } /></Routes></GlobalPrvdr>
            </QueryClientProvider>
        </Router> 
    ); 
}

export default App;