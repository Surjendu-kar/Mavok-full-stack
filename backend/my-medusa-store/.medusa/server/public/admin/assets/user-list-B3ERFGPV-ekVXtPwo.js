import{S as g}from"./chunk-2RQLKDBF-DppJ2vsa.js";import{u as x,D as b}from"./chunk-OYHBAUAW-Bh910uOp.js";import{a as h,j as s,es as j,b as c,H as v,B as y,L as P,r as C,k as S,A as T}from"./index-BxRPZUbt.js";import"./lodash-Wa3tNvWF.js";import{u as k}from"./chunk-C76H5USB-C4KynttQ.js";import"./chunk-FZFMTVUS-B6epN2ER.js";import"./chunk-BNLHRJ2A-Cy9oezEa.js";import"./chunk-KHOKHZC6-BT2W526V.js";import{P as w}from"./pencil-square-DPRnN69u.js";import{C as D}from"./container-C8-EYVG6.js";import{c as E}from"./index-BpYtoVSX.js";import"./Trans-Djefil4l.js";import"./x-mark-mini-CdT8Gfml.js";import"./check-CgVhTlWH.js";import"./chunk-YEDAFXMB-Q_4fYbM3.js";import"./chunk-AOFGTNG6-D4HQXs0t.js";import"./chunk-WX2SMNCD-CYNKb9PK.js";import"./plus-mini-CSilrpvR.js";import"./command-bar-Bfh-9oY8.js";import"./index-B2CyCadw.js";import"./chunk-IVEEMMLZ-CPRLM5_J.js";import"./format-CSM4n_jz.js";import"./date-picker-BUKrjaEd.js";import"./clsx-B-dksMZM.js";import"./popover-DP_copnG.js";import"./triangle-left-mini-BVg8f3e8.js";var U=({user:e})=>{const{t:r}=c();return s.jsx(T,{groups:[{actions:[{icon:s.jsx(w,{}),label:r("actions.edit"),to:`${e.id}/edit`}]}]})},l=E(),L=()=>{const{t:e}=c();return C.useMemo(()=>[l.accessor("email",{header:e("fields.email"),cell:({row:r})=>r.original.email}),l.display({id:"name",header:e("fields.name"),cell:({row:r})=>{const a=[r.original.first_name,r.original.last_name].filter(Boolean).join(" ");return a||s.jsx("span",{className:"text-ui-fg-muted",children:"-"})}}),l.display({id:"actions",cell:({row:r})=>s.jsx(U,{user:r.original})})],[e])},N=({pageSize:e=20,prefix:r})=>{const a=k(["q","order","offset"],r),{offset:t,...o}=a;return{searchParams:{limit:e,offset:t?parseInt(t):0,...o},raw:a}},m=20,_=()=>{const{raw:e,searchParams:r}=N({pageSize:m}),{users:a,count:t,isPending:o,isError:p,error:d}=j(r,{placeholderData:S}),u=L(),{table:f}=x({data:a??[],columns:u,count:t,enablePagination:!0,getRowId:n=>n.id,pageSize:m}),{t:i}=c();if(p)throw d;return s.jsxs(D,{className:"divide-y p-0",children:[s.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[s.jsx(v,{children:i("users.domain")}),s.jsx(y,{size:"small",variant:"secondary",asChild:!0,children:s.jsx(P,{to:"invite",children:i("users.invite")})})]}),s.jsx(b,{table:f,columns:u,count:t,pageSize:m,isLoading:o,orderBy:[{key:"email",label:i("fields.email")},{key:"first_name",label:i("fields.firstName")},{key:"last_name",label:i("fields.lastName")}],navigateTo:n=>`${n.id}`,search:!0,pagination:!0,queryObject:e})]})},oe=()=>{const{getWidgets:e}=h();return s.jsx(g,{widgets:{after:e("user.list.after"),before:e("user.list.before")},children:s.jsx(_,{})})};export{oe as Component};
