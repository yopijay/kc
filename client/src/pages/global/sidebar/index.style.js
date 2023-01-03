export const swipe = {
    '& .MuiDrawer-paper': {
        boxSizing: 'border-box',
        width: 280,
        backgroundColor: '#FAFAFA',
        backdropFilter: 'blur(10px)',
        height: '100vh',
        '&::-webkit-scrollbar': { display: 'none' }
    }
}

export const link = {
    fontSize: { lg: '95%' },
    textDecoration: 'none',
    color: '#212b36',
    transition: 'transform .2s',
    cursor: 'pointer',
    padding: '3px 0',
    '&:hover': { color: '#728ca1' }
}