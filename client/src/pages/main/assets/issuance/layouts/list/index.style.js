export const search = {
    backgroundColor: '#FFFFFF',
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'flex-start',
    alignItems: 'center',
    border: 'solid 1px #F3F3F3',
    borderRadius: '50px',
    padding: '4px 10px',
    width: {
        xs: '100%',
        sm: '350px',
        md: '500px'
    }
}

export const btntxt = { 
    display: {
        xs: 'none',
        md: 'block'
    }, 
    textDecoration: 'none',
    cursor: 'pointer',
    backgroundColor: '#204c6f',
    color: '#ffffff',
    borderRadius: '7px',
    padding: '7px 15px',
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#1b405d' }
}

export const btnicon = {
    display: {
        xs: 'flex',
        md: 'none'
    }, 
    flexDirection: 'row', 
    justifyContent: 'center', 
    alignItems: 'center',
    backgroundColor: '#204c6f',
    borderRadius: '7px',
    padding: '8px 10px',
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#1b405d' }
}

export const btnimport = {
    display: 'flex', 
    flexDirection: 'row', 
    justifyContent: 'center', 
    alignItems: 'center',
    borderRadius: '7px',
    padding: '8px 10px',
    backgroundColor: '#1ccaff',
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#0099cc' }
}

export const btnexport = {
    display: 'flex', 
    flexDirection: 'row', 
    justifyContent: 'center', 
    alignItems: 'center',
    borderRadius: '7px',
    padding: '8px 10px',
    backgroundColor: '#1D6F42',
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#00431a' }
}

export const loader = {
    backgroundColor: '#FFFFFF', 
    padding: '10px 20px', 
    border: 'solid 1px #F3F3F3', 
    borderRadius: '10px'
}

export const asc = {
    padding: '3px 10px',
    borderRadius: '5px',
    fontSize: '100%',
    color: '#959595',
    backgroundColor: '#E5E5E5',
    transition: 'all 0.2s ease-in-out',
    cursor: 'pointer',
    '&:hover': { backgroundColor: '#E5E5E5' }
}

export const desc = {
    padding: '3px 10px',
    borderRadius: '5px',
    fontSize: '100%',
    color: '#959595',
    backgroundColor: '#E5E5E5',
    cursor: 'pointer'
}

export const ctgy = {
    padding: '3px 10px',
    borderRadius: '5px',
    fontSize: '95%',
    color: '#959595',
    backgroundColor: '#E5E5E5',
    cursor: 'pointer'
}

export const select = {
    backgroundColor: '#FFFFFF',
    width: {
        xs: '120px',
        sm: '200px'
    },
    border: 'solid 1px #F3F3F3',
    padding: {
        xs: '12px 8px 9px 8px',
        md: '9px 10px 6px 10px'
    },
    marginBottom: '5px',
    borderRadius: '5px'
}