import * as Yup from 'yup';
export const validation = () => ( 
    Yup.object({
        customer: Yup.string().required('This field is required!'),
        project: Yup.string().required('This field is requried!'),
        so_no: Yup.string().required('This field is required!'),
        service_location: Yup.string().required('This field is required!'),
        contact_person: Yup.string().required('This field is required!'),
        requested_by: Yup.string().required('This field is required!'),
        noted_by_sup: Yup.string().required('This field is required!'),
        evaluated_by: Yup.string().required('This field is required!'),
        noted_by: Yup.string().required('This field is required!'),
        received_by: Yup.string().required('This field is required!')
    }) 
);