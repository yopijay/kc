// Libraries
import { createContext, useState } from "react";

export const ProfileCntx = createContext();
export const ProfilePrvdr = (props) => { 
    const { children } = props; 
    const [ data, setData ] = useState([]); 
    
    return <ProfileCntx.Provider value= {{ data, setData }}>{ children }</ProfileCntx.Provider> 
}