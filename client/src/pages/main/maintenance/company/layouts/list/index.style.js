export const search = {
    backgroundColor: '#FFFFFF',
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'flex-start',
    alignItems: 'center',
    border: 'solid 1px #F3F3F3A8',
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
    backgroundColor: '#0097A7',
    color: '#E0F2F1',
    borderRadius: '7px',
    padding: '7px 15px',
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#006064' }
}

export const btnicon = {
    display: {
        xs: 'flex',
        md: 'none'
    }, 
    flexDirection: 'row', 
    justifyContent: 'center', 
    alignItems: 'center',
    backgroundColor: '#0097A7',
    borderRadius: '7px',
    padding: '8px 10px',
    transition: 'all 0.2s ease-in-out',
    '&:hover': { backgroundColor: '#006064' }
}

export const btnimport = {
    display: 'flex', 
    flexDirection: 'row', 
    justifyContent: 'center', 
    alignItems: 'center',
    borderRadius: '7px',
    padding: '8px 10px',
    backgroundColor: '#1ccaff',
    cursor: 'pointer',
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
    cursor: 'pointer',
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