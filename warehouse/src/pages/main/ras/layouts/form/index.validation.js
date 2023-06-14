import * as Yup from 'yup';
export const validation = () => ( Yup.object({ item_code: Yup.string().required('This field is required!') }) );