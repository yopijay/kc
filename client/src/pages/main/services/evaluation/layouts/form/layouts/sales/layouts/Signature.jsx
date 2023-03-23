// Libraries
import { Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext, useEffect, useRef } from "react";
import SignaturePad from "react-signature-canvas";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEraser } from "@fortawesome/free-solid-svg-icons";
import { useParams } from "react-router-dom";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { input } from "../../../index.style"; // Styles

const Signature = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, setValue, getValues, setError } = useContext(FormCntxt);
    let _rb = useRef();
    let _nbs = useRef();

    useEffect(() => { 
        if(!fetching) {
            if(type === 'update') {
                _rb.current.fromDataURL(getValues().requested_by_signature);
                _nbs.current.fromDataURL(getValues().noted_by_sup_signature);
            }
        }
    }, [ fetching, type, getValues ]);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ marginTop: '10px' }}>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        <SignaturePad ref= { _rb } canvasProps= {{ width: 'auto', height: '100%' }}
                            onEnd= { e => { setValue('requested_by_signature', e.target.toDataURL()); setError('requested_by', { message: '' }); } } />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                        { (getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved')) ?
                            <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => { _rb.current.clear(); setValue('requested_by_signature', null); } } /> : '' }
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('requested_by') } name= "requested_by" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input }
                            disabled= { !(getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved')) } /> }
                    <Typography variant= "body2" gutterBottom>Requested by</Typography>
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.requested_by?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        <SignaturePad ref= { _nbs } canvasProps= {{ width: 'auto', height: '100%' }} onEnd= { e => setValue('noted_by_sup_signature', e.target.toDataURL()) } />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                        { (getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved')) ?
                            <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => { _nbs.current.clear(); setValue('noted_by_sup_signature', null); } } /> : '' }
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('noted_by_sup') } name= "noted_by_sup" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input }
                            disabled= { !(getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved')) } /> }
                    <Typography variant= "body2" gutterBottom>{ `Noted by (Immediate Superior)` }</Typography>
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.noted_by_sup?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Signature;
