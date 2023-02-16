// Libraries
import { createContext, useState } from "react";

export const GlobalCntx = createContext();
export const GlobalPrvdr = (props) => {
    const { children, window } = props;
    const [ open, setOpen ] = useState({ left: false });
    const [ orderby, setOrderby ] = useState('desc');
    const [ category, setCategory ] = useState('date_created');
    const [ searchtxt, setSearchtxt ] = useState('');
    const [ message, setMessage ] = useState('');
    const [ filters, setFilters ] = useState({});
    const [ errors, setErrors ] = useState([]);
    const [ isActive, setActive ] = useState(localStorage.getItem('nav'));

    const drawerToggle = (open) => (event) => {
        if(event && event.type === 'keydown' && (event.key === 'Tab' || event.key === 'Shift')) { return; }
        setOpen({ left: open });
    }

    const container = window !== undefined ? () => window().document.body : undefined;
    return (
        <GlobalCntx.Provider 
            value= {{ open, drawerToggle, container, isActive, setActive, setOpen, orderby, setOrderby, category, setCategory, 
                            searchtxt, setSearchtxt, message, setMessage, errors, setErrors, filters, setFilters }}>
            { children }
        </GlobalCntx.Provider>
    )
}