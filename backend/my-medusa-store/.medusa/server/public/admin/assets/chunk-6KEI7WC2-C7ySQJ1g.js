import{b as d,r as c,j as s,Y as m}from"./index-BxRPZUbt.js";import{g as p}from"./chunk-KDXAFTVE-BIJQy-Te.js";import{T as u,a as f}from"./chunk-MSDRGCRR-Wo7ejLev.js";import{S as x}from"./chunk-ADOCJB6L-BAtYHWA7.js";import{u as h}from"./chunk-C76H5USB-C4KynttQ.js";import{c as j}from"./index-BpYtoVSX.js";var N=()=>{const{t:e}=d();return[{label:e("fields.createdAt"),key:"created_at",type:"date"},{label:e("fields.updatedAt"),key:"updated_at",type:"date"}]},v=({code:e})=>s.jsx("div",{className:"flex h-full w-full items-center gap-x-3 overflow-hidden",children:s.jsx(m,{size:"2xsmall",className:"truncate",children:e})}),y=({text:e})=>s.jsx("div",{className:" flex h-full w-full items-center ",children:s.jsx("span",{children:e})}),b=({promotion:e})=>{const{t}=d(),a={DISABLED:["grey",t("statuses.disabled")],ACTIVE:["green",t("statuses.active")],SCHEDULED:["orange",t("statuses.scheduled")],EXPIRED:["red",t("statuses.expired")]},[r,o]=a[p(e)];return s.jsx(x,{color:r,children:o})},l=j(),D=()=>{const{t:e}=d();return c.useMemo(()=>[l.display({id:"code",header:()=>s.jsx(y,{text:e("fields.code")}),cell:({row:t})=>s.jsx(v,{code:t.original.code})}),l.display({id:"method",header:()=>s.jsx(u,{text:e("promotions.fields.method")}),cell:({row:t})=>{const a=t.original.is_automatic?e("promotions.form.method.automatic.title"):e("promotions.form.method.code.title");return s.jsx(f,{text:a})}}),l.display({id:"status",header:()=>s.jsx(u,{text:e("fields.status")}),cell:({row:t})=>s.jsx(b,{promotion:t.original})})],[e])},H=({prefix:e,pageSize:t=20})=>{const a=h(["offset","q","created_at","updated_at"],e),{offset:r,q:o,created_at:i,updated_at:n}=a;return{searchParams:{limit:t,created_at:i?JSON.parse(i):void 0,updated_at:n?JSON.parse(n):void 0,offset:r?Number(r):0,q:o},raw:a}};export{N as a,D as b,H as u};
