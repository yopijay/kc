// Libraries
import { Grid, Skeleton, Stack, TextField, Typography } from "@mui/material";
import { useContext, useEffect, useRef } from "react";
import { useParams } from "react-router-dom";
import SignaturePad from "react-signature-canvas";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEraser } from "@fortawesome/free-solid-svg-icons";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { input } from "../../../index.style"; // Styles

const Evaluator = ({ fetching }) => {
    const { type } = useParams();
    const { register, errors, setValue, getValues, setError } = useContext(FormCntxt);
    let _eb = useRef();
    let _ebs = useRef();

    useEffect(() => {
        if(!fetching) {
            if(type === 'update') {
                _eb.current.fromDataURL(getValues().evaluated_by_signature);
                _ebs.current.fromDataURL(getValues().eval_noted_by_sup_signature);
            }
        }
    }, [ fetching, type, getValues ]);

    return (
        <Grid container direction= "row" justifyContent= "flex-start" alignItems= "flex-start" spacing= { 1 } sx= {{ marginTop: '10px' }}>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        <SignaturePad ref= { _eb } canvasProps= {{ width: 'auto', height: '100%' }} 
                            onEnd= { e => { setValue('evaluated_by_signature', e.target.toDataURL()); setError('evaluated_by', { message: '' }); } } />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                        { (getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) ? 
                            <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => { _eb.current.clear(); setValue('evaluated_by_signature', null); } } /> : ''}
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('evaluated_by') } name= "evaluated_by" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input }
                            disabled= { !(getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) } /> }
                    <Typography variant= "body2">Evaluated by</Typography>
                    <Typography variant= "body2" color= "error.dark">{ errors.evaluated_by?.message }</Typography>
                </Stack>
            </Grid>
            <Grid item xs= { 12 } sm= { 6 }>
                <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 }>
                    <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                        <SignaturePad ref= { _ebs } canvasProps= {{ width: 'auto', height: '100%' }} 
                            onEnd= { e => { setValue('eval_noted_by_sup_signature', e.target.toDataURL()); setError('eval_noted_by_sup', { message: '' }); } } />
                    </Stack>
                    <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                        { (getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) ?
                            <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => { _ebs.current.clear(); setValue('eval_noted_by_sup_signature', null); } } /> : '' }
                    </Stack>
                    { fetching ? <Skeleton variant= "rounded" height= "35px" /> :
                        <TextField { ...register('eval_noted_by_sup') } name= "eval_noted_by_sup" variant= "standard" InputProps= {{ disableUnderline: true }} sx= { input }
                            disabled= { !(getValues()?.status !== undefined && (getValues()?.status === 'posted' || getValues()?.status === 'saved' || getValues()?.status === 'approved')) } /> }
                    <Typography variant= "body2">{ `Noted by (Immediate Superior)` }</Typography>
                    <Typography variant= "body2" color= "error.dark">{ errors.eval_noted_by_sup?.message }</Typography>
                </Stack>
            </Grid>
        </Grid>
    );
}

export default Evaluator;