// Libraires
import { useContext, useRef } from "react";
import { Skeleton, Stack, TextareaAutosize, Typography } from "@mui/material";
import SignaturePad from "react-signature-canvas";
import { faEraser } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

// Core
import { FormCntxt } from "core/context/Form"; // Context

// Constants
import { textarea } from "../../../index.style"; // Styles

const Comments = ({ fetching }) => {
    const { register, setValue, setError } = useContext(FormCntxt);
    let _cs = useRef();

    return (
        <Stack direction= "column" justifyContent= "flex-start" alignItems= "stretch" spacing= { 1 } sx= {{ marginTop: '20px' }}>
            <Stack direction= "column" justifyContent= "center" alignItems= "center" sx= {{ backgroundColor: '#F2F2F2', width: '100%', height: '120px', overflow: 'hidden' }}>
                <SignaturePad ref= { _cs } canvasProps= {{ width: 'auto', height: '100%' }} 
                    onEnd= { e => { setValue('recommendation_signature', e.target.toDataURL()); setError('prepared_by', { message: '' }); } } />
            </Stack>
            <Stack direction= "row" justifyContent= "flex-end" alignItems= "center" sx= {{ width: '100%' }}>
                <FontAwesomeIcon icon= { faEraser } color= "#818181" size= "lg" onClick= { () => { _cs.current.clear(); setValue('recommendation_signature', null); } } />
            </Stack>
            <Typography variant= "body2" gutterBottom>Remarks/Comments</Typography>
            { fetching ? <Skeleton variant= "rectangular" height= "100px" sx= {{ borderRadius: '5px' }} /> : 
                <TextareaAutosize name= "comments" { ...register('comments') } minRows= { 4 } maxRows= { 4 } style= { textarea } /> }
        </Stack>
    );
}

export default Comments;