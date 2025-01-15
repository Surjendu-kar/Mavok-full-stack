import{T as _,u as w,a as E,b as D}from"./chunk-FRU2J3XZ-LbzR2Oa3.js";import{u as N,a as C,T as O}from"./chunk-LUX6V5NS-DTVkF4G7.js";import{T as z}from"./chunk-L72F5JVQ-Bc-_UamX.js";import{a as j}from"./chunk-THZJC662-D8uxQDqu.js";import{R as k,r as T,d as B,fg as A,a as I,j as e,dJ as L,b as x,V as J,Y as q,fb as F,H as R,T as f,B as g,k as S}from"./index-BxRPZUbt.js";import{fh as we,fi as Ee}from"./index-BxRPZUbt.js";import{S as G}from"./chunk-2RQLKDBF-DppJ2vsa.js";import"./lodash-Wa3tNvWF.js";import{a as H}from"./chunk-6YTJEFSJ-ogWe34hv.js";import{C as u}from"./container-C8-EYVG6.js";import{A as Q}from"./alert-BGVlciuX.js";import"./chunk-C76H5USB-C4KynttQ.js";import"./chunk-V3MOBCDF-Fr8ItIPO.js";import"./chunk-3WXBLS2P-MKHj1mOQ.js";import"./chunk-YEDAFXMB-Q_4fYbM3.js";import"./chunk-AOFGTNG6-D4HQXs0t.js";import"./chunk-WX2SMNCD-CYNKb9PK.js";import"./plus-mini-CSilrpvR.js";import"./index-BpYtoVSX.js";import"./pencil-square-DPRnN69u.js";import"./trash-D7gRgiti.js";import"./arrow-down-right-mini-CCRtal8t.js";import"./status-badge-SdCm7goQ.js";import"./chunk-EQTBJSBZ-CM8oemU9.js";import"./react-country-flag.esm-f6BBnoiE.js";import"./use-prompt-CljjOm9N.js";import"./prompt-Ad_DCR5S.js";import"./Trans-Djefil4l.js";import"./x-mark-mini-CdT8Gfml.js";import"./check-CgVhTlWH.js";var X=({taxRegion:s})=>{const{t:r}=x(),i=s.tax_rates.filter(a=>a.is_default===!0),t=i.length===0;return e.jsxs(u,{className:"divide-y p-0",children:[e.jsx(z,{taxRegion:s,type:"header",asLink:!1,badge:t&&e.jsx(J,{content:r("taxRegions.fields.noDefaultRate.tooltip"),children:e.jsx(q,{color:"orange",size:"2xsmall",className:"cursor-default",children:r("taxRegions.fields.noDefaultRate.label")})})}),i.map(a=>e.jsx(_,{taxRate:a},a.id))]})},h=10,v="p",Z=({taxRegion:s,showSublevelRegions:r})=>{const{t:i}=x(),{searchParams:t,raw:a}=N({pageSize:h,prefix:v}),{tax_regions:o,count:n,isPending:c,isError:l,error:m}=F({...t,parent_id:s.id},{placeholderData:S}),{table:y}=C({count:n,data:o,pageSize:h,prefix:v}),d=j(s.country_code);if(!d&&!r&&!s.children.length)return null;const P=(d==null?void 0:d.type)||"sublevel";if(l)throw m;return e.jsx(u,{className:"divide-y p-0",children:e.jsx(O,{variant:"province",action:{to:"provinces/create",label:i("actions.create")},table:y,isPending:c,queryObject:a,count:n,children:e.jsx(R,{level:"h2",children:i(`taxRegions.${P}.header`)})})})},b=10,p="o",V=({taxRegion:s})=>{const{t:r}=x(),{searchParams:i,raw:t}=w({pageSize:b,prefix:p}),{tax_rates:a,count:o,isPending:n,isError:c,error:l}=H({...i,tax_region_id:s.id,is_default:!1},{placeholderData:S}),{table:m}=E({count:o,data:a,pageSize:b,prefix:p});if(c)throw l;return e.jsx(u,{className:"p-0",children:e.jsx(D,{isPending:n,table:m,count:o,action:{label:r("actions.create"),to:"overrides/create"},queryObject:t,prefix:p,children:e.jsx(R,{level:"h2",children:r("taxRegions.taxOverrides.header")})})})},W=({taxRegion:s,showSublevelRegions:r,setShowSublevelRegions:i})=>{const{t}=x(),[a,o]=T.useState(!1);return j(s.country_code)||r||a||s.children.length?null:e.jsx(Q,{dismissible:!0,variant:"info",className:"bg-ui-bg-base",children:e.jsxs("div",{className:"flex flex-col gap-y-3",children:[e.jsxs("div",{className:"flex flex-col",children:[e.jsx(f,{size:"small",leading:"compact",weight:"plus",asChild:!0,children:e.jsx("h2",{children:t("taxRegions.fields.sublevels.alert.header")})}),e.jsx(f,{size:"small",leading:"compact",className:"text-pretty",children:t("taxRegions.fields.sublevels.alert.description")})]}),e.jsxs("div",{className:"flex items-center gap-x-3",children:[e.jsx(g,{variant:"secondary",size:"small",onClick:()=>i(!0),children:t("taxRegions.fields.sublevels.alert.action")}),e.jsx(g,{variant:"transparent",size:"small",onClick:()=>o(!0),children:t("actions.hide")})]})]})})},ye=()=>{const{id:s}=k(),[r,i]=T.useState(!1),t=B(),{tax_region:a,isLoading:o,isError:n,error:c}=A(s,void 0,{initialData:t}),{getWidgets:l}=I();if(o||!a)return e.jsx(L,{sections:4,showJSON:!0});if(n)throw c;return e.jsxs(G,{data:a,showJSON:!0,widgets:{after:l("tax.details.after"),before:l("tax.details.before")},children:[e.jsx(W,{taxRegion:a,showSublevelRegions:r,setShowSublevelRegions:i}),e.jsx(X,{taxRegion:a}),e.jsx(Z,{taxRegion:a,showSublevelRegions:r}),e.jsx(V,{taxRegion:a})]})};export{we as Breadcrumb,ye as Component,ye as TaxRegionDetail,Ee as loader};