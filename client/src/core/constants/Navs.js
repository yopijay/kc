// Libraries
import React from 'react';

// Maintenance
const Company = React.lazy(() => import('pages/main/maintenance/company'));
const Department = React.lazy(() => import('pages/main/maintenance/department'));
const Position = React.lazy(() => import('pages/main/maintenance/position'));
const Category = React.lazy(() => import('pages/main/maintenance/category'));
const SubCategory = React.lazy(() => import('pages/main/maintenance/sub-category'));

// Services
const ServiceRequest = React.lazy(() => import('pages/main/services/request'));
const ServiceEvaluation = React.lazy(() => import('pages/main/services/evaluation'));
const ServiceDispatch = React.lazy(() => import('pages/main/services/dispatch'));
const ServiceReport = React.lazy(() => import('pages/main/services/reports'));

// Assets
const AssetRegistration = React.lazy(() => import('pages/main/assets/registration'));
const AssetIssuance = React.lazy(() => import('pages/main/assets/issuance'));

// Setup
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
            { path: '/tools/employee-tracker', label: 'Employee Tracker', name: 'employee-tracker', component: "EMPLOYEE TRACKER" }
        ]
    },
    {
        title: 'Maintenance', nav: [
            { path: '/maintenance/company', label: 'Company', name: 'company', component: <Company /> },
            { path: '/maintenance/department', label: 'Department', name: 'department', component: <Department /> },
            { path: '/maintenance/position', label: 'Position', name: 'position', component: <Position /> },
            { path: '/maintenance/category', label: 'Category', name: 'category', component: <Category /> },
            { path: '/maintenance/sub-category', label: 'Sub-category', name: 'sub-category', component: <SubCategory /> },
            { path: '/maintenance/customer', label: 'Customer', name: 'customer', component: 'Customer' },
        ]
    },
    {
        title: 'Services', nav: [
            { path: '/services/request', label: 'Request', name: 'service_request', component: <ServiceRequest /> },
            { path: '/services/evaluation', label: 'Evaluation', name: 'service_evaluation', component: <ServiceEvaluation /> },
            { path: '/services/dispatch', label: 'Dispatch', name: 'service_dispatch', component: <ServiceDispatch /> },
            { path: '/services/reports', label: 'Reports', name: 'service_reports', component: <ServiceReport /> },
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
            { path: '/assets/asset-issuance', label: 'Asset Issuance', name: 'asset-issuance', component: <AssetIssuance /> },
        ]
    },
    {
        title: 'User Role & Access', nav: [
            { path: '/user-roleaccess/user', label: 'User', name: 'user', component: <User /> },
        ]
    },
])