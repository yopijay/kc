export const input = {
    border: 'solid 1px #ced6e0',
    padding: {
        xs: '10px 8px 8px 8px',
        md: '6px 10px 5px 10px'
    },
    borderRadius: '5px'
}

export const select = {
    width: '100%',
    border: 'solid 1px #dfe4ea',
    padding: {
        xs: '12px 8px 9px 8px',
        md: '9px 10px 6px 10px'
    },
    marginBottom: '5px',
    borderRadius: '5px'
}

export const btntxt = { 
    display: 'flex',
    cursor: 'pointer',
    flexDirection: 'row', 
    justifyContent: 'center', 
    alignItems: 'center',
    backgroundColor: '#204c6f',
    color: '#ffffff',
    borderRadius: '7px',
    padding: '7px 0',
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#1b405d' }
}

export const card = { 
    flexGrow: 1, 
    backgroundColor: '#ffffff', 
    padding: '20px', 
    borderRadius: '8px',  
    overflowY: 'scroll', 
    '&::-webkit-scrollbar': { display: 'none' } 
}

export const addrow = {
    color: '#ffffff',
    backgroundColor: '#204c6f',
    borderRadius: '7px',
    padding: {
        xs: '5px 12px',
        md: '4px 10px'
    },
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#1b405d' }
}

export const textarea = {
    border: 'solid 1px #ced6e0',
    borderRadius: '5px',
    fontFamily: 'Gilroy Light',
    fontSize: '105%',
    padding: '10px',
    outline: 'none',
    textTransform: 'uppercase',
    color: '#353b48'
}