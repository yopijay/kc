// Libraries
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { QueryClient, QueryClientProvider } from 'react-query';

// Core
import { ProfilePrvdr } from "core/context/Profile";
import { GlobalPrvdr } from "core/context/Global";
import { FormPrvdr } from "core/context/Form";

// Layouts
import Authentication from 'pages/authentication';
import Main from 'pages/main';

const App = () => {
    const client = new QueryClient();
    
    return ( 
        <Router>
            <QueryClientProvider client= { client }>
                <GlobalPrvdr>
                    <Routes>
                        <Route path= "*" element= { localStorage.getItem('token') ? 
                            <ProfilePrvdr><Main /></ProfilePrvdr> : 
                            <FormPrvdr><Authentication /></FormPrvdr> } />
                        </Routes>
                    </GlobalPrvdr>
            </QueryClientProvider>
        </Router> 
    ); 
}

export default App;