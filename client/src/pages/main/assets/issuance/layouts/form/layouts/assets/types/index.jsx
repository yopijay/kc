// Libraries
import { Stack } from "@mui/material";

// Layouts
import OfficeChairs from "./office-furniture/OfficeChairs";
import OfficeDesk from "./office-furniture/OfficeDesk";
import Whiteboards from "./office-furniture/Whiteboards";
import FilingCabinet from "./office-furniture/FilingCabinet";
import SystemUnit from "./technology/SystemUnit";
import Laptop from "./technology/Laptop";
import Mouse from "./technology/Mouse";
import Keyboard from "./technology/Keyboard";
import Printer from "./technology/Printer";
import Monitor from "./technology/Monitor";
import NetworkingEquipments from "./technology/NetworkingEquipments";
import Harddrives from "./technology/Harddrives";
import Phone from "./technology/Phone";

const Index = ({ fetching, item, eqptype }) => {

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch">
            { item === 'office-desks' ? <OfficeDesk fetching= { fetching } /> :
                item === 'office-chairs' ? <OfficeChairs fetching= { fetching } /> :
                item === 'whiteboards' ? <Whiteboards fetching= { fetching } /> :
                item === 'filing-cabinets' ? <FilingCabinet fetching= { fetching } /> : 
                item === 'system-unit' ? <SystemUnit fetching= { fetching } /> :
                item === 'laptops' ? <Laptop fetching= { fetching } /> : 
                item === 'mouse' ? <Mouse fetching= { fetching } /> :
                item === 'keyboard' ? <Keyboard fetching= { fetching } /> :
                item === 'printer' ? <Printer fetching= { fetching } /> :
                item === 'monitor' ? <Monitor fetching= { fetching } /> :
                item === 'networking-equipments' ? <NetworkingEquipments fetching= { fetching } eqptype= { eqptype } /> :
                item === 'harddrives' ? <Harddrives fetching= { fetching } /> :
                item === 'phones' ? <Phone fetching= { fetching } /> : '' }
        </Stack>
    );
}

export default Index;