import * as Yup from 'yup';
export const validation = () => ( 
    Yup.object({
        // evaluated_by: Yup.string().required('This field is required!').nullable(),
        // noted_by: Yup.string().required('This field is required!').nullable(),
        // received_by: Yup.string().required('This field is required!').nullable()
    })
);