// Libraries
import { yupResolver } from "@hookform/resolvers/yup";
import { createContext, useState } from "react";
import { useForm } from "react-hook-form";

export const FormCntxt = createContext();

export const FormPrvdr = (props) => {
    const { children } = props;
    const [ fields, setFields ] = useState([]);
    const [ disabled, setDisabled ] = useState(false);
    const [ validation, setValidation ] = useState({});
    const [ series, setSeries ] = useState();
    const { register, handleSubmit, formState: { errors }, getValues, setValue, setError, control, clearErrors } = 
        useForm({ resolver: Object.keys(validation).length === 0 ? '' : yupResolver(validation) });

    return (
        <FormCntxt.Provider 
            value= {{ fields, setFields, disabled, setDisabled, setValidation, register, handleSubmit, errors, getValues, setValue, setError,
                                control, clearErrors, series, setSeries }}>
            { children }
        </FormCntxt.Provider>
    );
}