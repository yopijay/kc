import * as Yup from 'yup';
export const validation = () => ( 
    Yup.object({
        customer: Yup.string().required('This field is required!'),
        project: Yup.string().required('This field is requried!'),
        service_location: Yup.string().required('This field is required!'),
        contact_person: Yup.string().required('This field is required!'),
        time_expected: Yup.string().required('This field is required!')
    }) 
);