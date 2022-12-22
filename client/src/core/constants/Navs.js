// Libraries
import React from 'react';

// Components
const Dashboard = React.lazy(() => import('pages/main'));

export const Navs = () => ([
    {
        title: 'Main', nav: [
            { path: '/', label: 'Dashboard', name: 'home', component: <Dashboard />, access: [ 'superadmin', 'admin', 'user' ] }
        ]
    },
    {
        title: 'Tools', nav: [
            { path: '/tools/dsf', label: 'Daily Symptoms', name: 'dsf', component: "DAILY SYMPTOMS", access: [ 'superadmin', 'admin', 'user' ] },
            { path: '/tools/free-meal', label: 'Free Meal', name: 'free-meal', component: "FREE MEAL", access: [ 'superadmin', 'admin', 'user' ] },
        ]
    },
    {
        title: 'Maintenance', nav: [
            { path: '/maintenance/company', label: 'Company', name: 'company', component: 'COMPANY', access: [ 'superadmin', 'admin' ] },
            { path: '/maintenance/department', label: 'Department', name: 'department', component: 'DEPARTMENT', access: [ 'superadmin', 'admin' ] },
            { path: '/maintenance/position', label: 'Position', name: 'position', component: 'POSITION', access: [ 'superadmin', 'admin' ] },
            { path: '/maintenance/user', label: 'User', name: 'user', component: 'USER', access: [ 'superadmin', 'admin' ] },
        ]
    },
    {
        title: 'Warehouse', nav: [
            { path: '/warehouse/products', label: 'Products', name: 'products', component: 'PRODUCTS', access: [ 'superadmin', 'admin' ] },
            { path: '/warehouse/office-supplies', label: 'Office Supplies', name: 'office-supplies', component: 'OFFICE SUPPLIES', access: [ 'superadmin', 'admin' ] },
        ]
    },
    {
        title: 'Assets', nav: [
            { path: '/assets/category', label: 'Category', name: 'category', component: 'Category', access: [ 'superadmin', 'admin' ] },
            { path: '/assets/brand', label: 'Brand', name: 'brand', component: 'brand', access: [ 'superadmin', 'admin' ] },
            { path: '/assets/asset-registration', label: 'Asset Registration', name: 'asset-registration', component: 'ASSET REGISTRATION', access: [ 'superadmin', 'admin' ] },
            { path: '/assets/asset-issuance', label: 'Asset Issuance', name: 'asset-issuance', component: 'ASSET ISSUANCE', access: [ 'superadmin', 'admin' ] },
        ]
    }
])