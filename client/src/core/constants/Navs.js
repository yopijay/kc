// Libraries
import React from 'react';

// Maintenance
const Company = React.lazy(() => import('pages/main/maintenance/company'));
const Department = React.lazy(() => import('pages/main/maintenance/department'));
const Position = React.lazy(() => import('pages/main/maintenance/position'));
const Category = React.lazy(() => import('pages/main/maintenance/category'));
const SubCategory = React.lazy(() => import('pages/main/maintenance/sub-category'));

// Assets
const AssetRegistration = React.lazy(() => import('pages/main/assets/registration'));

// User & Role Access
const User = React.lazy(() => import('pages/main/user-roleaccess/user'));

export const Navs = () => ([
    {
        title: 'Main', nav: [
            { path: '/', label: 'Dashboard', name: 'home', component: 'DASHBOARD' }
        ]
    },
    {
        title: 'Tools', nav: [
            { path: '/tools/dsf', label: 'Daily Symptoms', name: 'dsf', component: "DAILY SYMPTOMS" },
            { path: '/tools/free-meal', label: 'Free Meal', name: 'free-meal', component: "FREE MEAL" },
        ]
    },
    {
        title: 'Maintenance', nav: [
            { path: '/maintenance/company', label: 'Company', name: 'company', component: <Company /> },
            { path: '/maintenance/department', label: 'Department', name: 'department', component: <Department /> },
            { path: '/maintenance/position', label: 'Position', name: 'position', component: <Position /> },
            { path: '/maintenance/category', label: 'Category', name: 'category', component: <Category /> },
            { path: '/maintenance/sub-category', label: 'Sub-category', name: 'sub-category', component: <SubCategory /> },
        ]
    },
    {
        title: 'Supplies', nav: [
            { path: '/supplies', label: 'Supplies Registration', name: 'supplies-registration', component: 'SUPPLIES REGISTRATION' }
        ]
    },
    {
        title: 'Assets', nav: [
            { path: '/assets/asset-registration', label: 'Asset Registration', name: 'asset-registration', component: <AssetRegistration /> },
            { path: '/assets/asset-issuance', label: 'Asset Issuance', name: 'asset-issuance', component: 'ASSET ISSUANCE' },
        ]
    },
    {
        title: 'User Role & Access', nav: [
            { path: '/user-roleaccess/user', label: 'User', name: 'user', component: <User /> },
        ]
    },
])