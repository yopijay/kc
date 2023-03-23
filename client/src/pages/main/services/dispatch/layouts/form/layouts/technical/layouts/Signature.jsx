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
    let _pb = useRef();
    let _nb = useRef();
    let _rlb = useRef();
    let _ab = useRef();
    let _apb = useRef();
    let _rcb = useRef();

    useEffect(() => {
        if(!fetching) {
            if(type === 'update') {
                _pb.current.fromDataURL(getValues().prepared_by_signature);
                _nb.current.fromDataURL(getValues().noted_by_signature);
                _rlb.current.fromDataURL(getValues().released_by_signature);
                _ab.current.fromDataURL(getValues().authorized_by_signature);
                _apb.current.fromDataURL(getValues().approved_by_signature);
                _rcb.current.fromDataURL(getValues().received_by_signature);
            }
        }
    }, [ fetching, type, getValues ]);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ marginTop: '10px' }}>
            <Grid item xs= { 12 } sm= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        <SignaturePad ref= { _pb } canvasProps= {{ width: 'auto', height: '100%' }} 
                            onEnd= { e => { setValue('prepared_by_signature', e.target.toDataURL()); setError('prepared_by', { message: '' }); } } />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                        <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => _pb.current.clear() } />
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('prepared_by') } name= "prepared_by" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                    <Typography variant= "body2">Prepared by</Typography>
                    <Typography variant= "body2" color= "error.dark">{ errors.prepared_by?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        <SignaturePad ref= { _nb } canvasProps= {{ width: 'auto', height: '100%' }} 
                            onEnd= { e => { setValue('noted_by_signature', e.target.toDataURL()); setError('noted_by', { message: '' }); } } />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                        <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => _nb.current.clear() } />
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('noted_by') } name= "noted_by" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                    <Typography variant= "body2">Noted by</Typography>
                    <Typography variant= "body2" color= "error.dark" mt= "5px">{ errors.noted_by?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        <SignaturePad ref= { _rlb } canvasProps= {{ width: 'auto', height: '100%' }} 
                            onEnd= { e => { setValue('released_by_signature', e.target.toDataURL()); setError('released_by', { message: '' }); } } />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                        <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => _rlb.current.clear() } />
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('released_by') } name= "released_by" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                    <Typography variant= "body2">Released by</Typography>
                    <Typography variant= "body2" color= "error.dark">{ errors.released_by?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        <SignaturePad ref= { _ab } canvasProps= {{ width: 'auto', height: '100%' }} 
                            onEnd= { e => { setValue('authorized_by_signature', e.target.toDataURL()); setError('authorized_by', { message: '' }); } } />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                        <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => _ab.current.clear() } />
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('authorized_by') } name= "authorized_by" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                    <Typography variant= "body2">Authorized by</Typography>
                    <Typography variant= "body2" color= "error.dark">{ errors.authorized_by?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 3 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        <SignaturePad ref= { _apb } canvasProps= {{ width: 'auto', height: '100%' }} 
                            onEnd= { e => { setValue('authorized_by_signature', e.target.toDataURL()); setError('approved_by', { message: '' }); } } />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                        <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => _apb.current.clear() } />
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('approved_by') } name= "approved_by" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                    <Typography variant= "body2">Approved by</Typography>
                    <Typography variant= "body2" color= "error.dark">{ errors.approved_by?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        <SignaturePad ref= { _rcb } canvasProps= {{ width: 'auto', height: '100%' }} 
                            onEnd= { e => { setValue('received_by_signature', e.target.toDataURL()); setError('received_by', { message: '' }); } } />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                        <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => _rcb.current.clear() } />
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('received_by') } name= "received_by" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input } /> }
                    <Typography variant= "body2">Received by</Typography>
                    <Typography variant= "body2" color= "error.dark">{ errors.received_by?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Signature;
