import{L as g}from"./chunk-I3VB6NM2-MeV93mlH.js";import{f as y}from"./chunk-IR5DHEKS-aVJcUHa1.js";import{b as o,r as j,j as s,d2 as P,a as T,i as _,k as C,H as N,T as R,L as w,B as S,ej as k,A as z,t as x}from"./index-BxRPZUbt.js";import{P as h}from"./chunk-P3UUX2T6-BqASRlOM.js";import{c as v}from"./index-BpYtoVSX.js";import{u as A}from"./chunk-C76H5USB-C4KynttQ.js";import{S as D}from"./chunk-2RQLKDBF-DppJ2vsa.js";import{u as H,D as E}from"./chunk-OYHBAUAW-Bh910uOp.js";import"./lodash-Wa3tNvWF.js";import"./chunk-FZFMTVUS-B6epN2ER.js";import"./chunk-BNLHRJ2A-Cy9oezEa.js";import"./chunk-KHOKHZC6-BT2W526V.js";import{P as L}from"./pencil-square-DPRnN69u.js";import{T as q}from"./trash-D7gRgiti.js";import{u as B}from"./use-prompt-CljjOm9N.js";import{C as M}from"./container-C8-EYVG6.js";import"./Trans-Djefil4l.js";import"./x-mark-mini-CdT8Gfml.js";import"./check-CgVhTlWH.js";import"./chunk-YEDAFXMB-Q_4fYbM3.js";import"./chunk-AOFGTNG6-D4HQXs0t.js";import"./chunk-WX2SMNCD-CYNKb9PK.js";import"./plus-mini-CSilrpvR.js";import"./command-bar-Bfh-9oY8.js";import"./index-B2CyCadw.js";import"./chunk-IVEEMMLZ-CPRLM5_J.js";import"./format-CSM4n_jz.js";import"./date-picker-BUKrjaEd.js";import"./clsx-B-dksMZM.js";import"./popover-DP_copnG.js";import"./triangle-left-mini-BVg8f3e8.js";import"./prompt-Ad_DCR5S.js";var O=({prefix:e,pageSize:r=20})=>{const a=A(["offset","q","order","created_at","updated_at"],e),{offset:t,q:i,order:l,created_at:n,updated_at:c}=a;return{searchParams:{limit:r,offset:t?Number(t):0,order:l,created_at:n?JSON.parse(n):void 0,updated_at:c?JSON.parse(c):void 0,q:i},raw:a}},F=()=>{const{t:e}=o();return[...[{label:e("fields.createdAt"),key:"created_at"},{label:e("fields.updatedAt"),key:"updated_at"}].map(t=>({key:t.key,label:t.label,type:"date"}))]},I=({countries:e})=>{if(!e||e.length===0)return s.jsx(h,{});const r=e.map(a=>{var t;return(t=P.find(i=>i.iso_2===a.iso_2))==null?void 0:t.display_name}).filter(Boolean);return s.jsx("div",{className:"flex size-full items-center overflow-hidden",children:s.jsx(g,{list:r})})},$=()=>{const{t:e}=o();return s.jsx("div",{className:"flex size-full items-center",children:s.jsx("span",{children:e("fields.countries")})})},J=({paymentProviders:e})=>{if(!e||e.length===0)return s.jsx(h,{});const r=e.map(a=>y(a.id));return s.jsx("div",{className:"flex size-full items-center overflow-hidden",children:s.jsx(g,{list:r})})},Q=()=>{const{t:e}=o();return s.jsx("div",{className:"flex size-full items-center overflow-hidden",children:s.jsx("span",{className:"truncate",children:e("fields.paymentProviders")})})},W=({name:e})=>s.jsx("div",{className:"flex h-full w-full items-center overflow-hidden",children:s.jsx("span",{className:"truncate",children:e})}),G=()=>{const{t:e}=o();return s.jsx("div",{className:"flex h-full w-full items-center",children:s.jsx("span",{className:"truncate",children:e("fields.name")})})},m=v(),V=()=>j.useMemo(()=>[m.accessor("name",{header:()=>s.jsx(G,{}),cell:({getValue:e})=>s.jsx(W,{name:e()})}),m.accessor("countries",{header:()=>s.jsx($,{}),cell:({getValue:e})=>s.jsx(I,{countries:e()})}),m.accessor("payment_providers",{header:()=>s.jsx(Q,{}),cell:({getValue:e})=>s.jsx(J,{paymentProviders:e()})})],[]),u=20,Y=()=>{const{t:e}=o(),{searchParams:r,raw:a}=O({pageSize:u}),{regions:t,count:i,isPending:l,isError:n,error:c}=_({...r,fields:"*payment_providers"},{placeholderData:C}),p=F(),f=U(),{table:b}=H({data:t??[],columns:f,count:i,enablePagination:!0,getRowId:d=>d.id,pageSize:u});if(n)throw c;return s.jsxs(M,{className:"divide-y p-0",children:[s.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[s.jsxs("div",{children:[s.jsx(N,{children:e("regions.domain")}),s.jsx(R,{className:"text-ui-fg-subtle",size:"small",children:e("regions.subtitle")})]}),s.jsx(w,{to:"/settings/regions/create",children:s.jsx(S,{size:"small",variant:"secondary",children:e("actions.create")})})]}),s.jsx(E,{table:b,columns:f,count:i,pageSize:u,isLoading:l,filters:p,orderBy:[{key:"name",label:e("fields.name")},{key:"created_at",label:e("fields.createdAt")},{key:"updated_at",label:e("fields.updatedAt")}],navigateTo:d=>`${d.original.id}`,pagination:!0,search:!0,queryObject:a,noRecords:{message:e("regions.list.noRecordsMessage")}})]})},Z=({region:e})=>{const{t:r}=o(),a=B(),{mutateAsync:t}=k(e.id),i=async()=>{await a({title:r("general.areYouSure"),description:r("regions.deleteRegionWarning",{name:e.name}),verificationText:e.name,verificationInstruction:r("general.typeToConfirm"),confirmText:r("actions.delete"),cancelText:r("actions.cancel")})&&await t(void 0,{onSuccess:()=>{x.success(r("regions.toast.delete"))},onError:n=>{x.error(n.message)}})};return s.jsx(z,{groups:[{actions:[{label:r("actions.edit"),to:`/settings/regions/${e.id}/edit`,icon:s.jsx(L,{})}]},{actions:[{label:r("actions.delete"),onClick:i,icon:s.jsx(q,{})}]}]})},K=v(),U=()=>{const e=V();return j.useMemo(()=>[...e,K.display({id:"actions",cell:({row:r})=>s.jsx(Z,{region:r.original})})],[e])},ze=()=>{const{getWidgets:e}=T();return s.jsx(D,{widgets:{before:e("region.list.before"),after:e("region.list.after")},children:s.jsx(Y,{})})};export{ze as Component};