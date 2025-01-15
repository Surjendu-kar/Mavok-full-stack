import{u as q}from"./chunk-RJSD5KRU-BfsVzOGX.js";import{h as S,j as t,q as B,d as L,R as z,a as M,dJ as $,p as H,s as O,b as p,u as Q,ev as J,H as y,A as j,T as h,r as b,e as W,k as F,ex as v,L as G,B as K,t as l}from"./index-BxRPZUbt.js";import{u as Y,a as Z}from"./chunk-ZE4FSVPB-2qZwfadS.js";import{S as U}from"./chunk-2RQLKDBF-DppJ2vsa.js";import{u as V,D as X}from"./chunk-OYHBAUAW-Bh910uOp.js";import"./lodash-Wa3tNvWF.js";import"./chunk-FZFMTVUS-B6epN2ER.js";import"./chunk-BNLHRJ2A-Cy9oezEa.js";import"./chunk-KHOKHZC6-BT2W526V.js";import{P as C}from"./pencil-square-DPRnN69u.js";import{T as P}from"./trash-D7gRgiti.js";import{u as w}from"./use-prompt-CljjOm9N.js";import{C as k}from"./container-C8-EYVG6.js";import{S as ee}from"./status-badge-SdCm7goQ.js";import{C as x}from"./checkbox-CGs03nqI.js";import{c as se}from"./index-BpYtoVSX.js";import"./chunk-RERSP5B2-CpYkKCYP.js";import"./chunk-ADOCJB6L-BAtYHWA7.js";import"./chunk-P3UUX2T6-BqASRlOM.js";import"./chunk-C76H5USB-C4KynttQ.js";import"./Trans-Djefil4l.js";import"./x-mark-mini-CdT8Gfml.js";import"./check-CgVhTlWH.js";import"./chunk-YEDAFXMB-Q_4fYbM3.js";import"./chunk-AOFGTNG6-D4HQXs0t.js";import"./chunk-WX2SMNCD-CYNKb9PK.js";import"./plus-mini-CSilrpvR.js";import"./command-bar-Bfh-9oY8.js";import"./index-B2CyCadw.js";import"./chunk-IVEEMMLZ-CPRLM5_J.js";import"./format-CSM4n_jz.js";import"./date-picker-BUKrjaEd.js";import"./clsx-B-dksMZM.js";import"./popover-DP_copnG.js";import"./triangle-left-mini-BVg8f3e8.js";import"./prompt-Ad_DCR5S.js";var Je=s=>{const{id:e}=s.params||{},{sales_channel:a}=S(e,{initialData:s.data,enabled:!!e});return a?t.jsx("span",{children:a.name}):null},te=s=>({queryKey:H.detail(s),queryFn:async()=>O.admin.salesChannel.retrieve(s)}),We=async({params:s})=>{const e=s.id,a=te(e);return B.ensureQueryData(a)},ae=({salesChannel:s})=>{const{t:e}=p(),a=w(),r=Q(),{mutateAsync:o}=J(s.id),c=async()=>{await a({title:e("general.areYouSure"),description:e("salesChannels.deleteSalesChannelWarning",{name:s.name}),verificationInstruction:e("general.typeToConfirm"),verificationText:s.name,confirmText:e("actions.delete"),cancelText:e("actions.cancel")})&&await o(void 0,{onSuccess:()=>{l.success(e("salesChannels.toast.delete")),r("/settings/sales-channels",{replace:!0})},onError:u=>{l.error(u.message)}})};return t.jsxs(k,{className:"divide-y p-0",children:[t.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[t.jsx(y,{children:s.name}),t.jsxs("div",{className:"flex items-center gap-x-2",children:[t.jsx(ee,{color:s.is_disabled?"red":"green",children:e(`general.${s.is_disabled?"disabled":"enabled"}`)}),t.jsx(j,{groups:[{actions:[{icon:t.jsx(C,{}),label:e("actions.edit"),to:`/settings/sales-channels/${s.id}/edit`}]},{actions:[{icon:t.jsx(P,{}),label:e("actions.delete"),onClick:c}]}]})]})]}),t.jsxs("div",{className:"text-ui-fg-subtle grid grid-cols-2 items-start px-6 py-4",children:[t.jsx(h,{size:"small",leading:"compact",weight:"plus",children:e("fields.description")}),t.jsx(h,{size:"small",leading:"compact",children:s.description||"-"})]})]})},m=10,ne=({salesChannel:s})=>{const[e,a]=b.useState({}),{searchParams:r,raw:o}=Y({pageSize:m}),{products:c,count:d,isPending:u,isError:T,error:D}=W({...r,sales_channel_id:[s.id]},{placeholderData:F}),g=re(),_=Z(["sales_channel_id"]),{table:R}=V({data:c??[],columns:g,count:d,enablePagination:!0,enableRowSelection:!0,pageSize:m,getRowId:i=>i.id,rowSelection:{state:e,updater:a},meta:{salesChannelId:s.id}}),{mutateAsync:A}=v(s.id),E=w(),{t:n}=p(),N=async()=>{const i=Object.keys(e);await E({title:n("general.areYouSure"),description:n("salesChannels.removeProductsWarning",{count:i.length,sales_channel:s.name}),confirmText:n("actions.delete"),cancelText:n("actions.cancel")})&&await A(i,{onSuccess:()=>{l.success(n("salesChannels.toast.update")),a({})},onError:I=>{l.error(I.message)}})};if(T)throw D;return t.jsxs(k,{className:"divide-y p-0",children:[t.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[t.jsx(y,{level:"h2",children:n("products.domain")}),t.jsx(G,{to:`/settings/sales-channels/${s.id}/add-products`,children:t.jsx(K,{size:"small",variant:"secondary",children:n("general.add")})})]}),t.jsx(X,{table:R,columns:g,pageSize:m,commands:[{action:N,label:n("actions.remove"),shortcut:"r"}],count:d,pagination:!0,search:!0,filters:_,navigateTo:i=>`/products/${i.id}`,isLoading:u,orderBy:[{key:"title",label:n("fields.title")},{key:"status",label:n("fields.status")},{key:"created_at",label:n("fields.createdAt")},{key:"updated_at",label:n("fields.updatedAt")}],queryObject:o,noRecords:{message:n("salesChannels.products.list.noRecordsMessage")}})]})},f=se(),re=()=>{const s=q();return b.useMemo(()=>[f.display({id:"select",header:({table:e})=>t.jsx(x,{checked:e.getIsSomePageRowsSelected()?"indeterminate":e.getIsAllPageRowsSelected(),onCheckedChange:a=>e.toggleAllPageRowsSelected(!!a)}),cell:({row:e})=>t.jsx(x,{checked:e.getIsSelected(),onCheckedChange:a=>e.toggleSelected(!!a),onClick:a=>{a.stopPropagation()}})}),...s,f.display({id:"actions",cell:({row:e,table:a})=>{const{salesChannelId:r}=a.options.meta;return t.jsx(oe,{productId:e.original.id,salesChannelId:r})}})],[s])},oe=({salesChannelId:s,productId:e})=>{const{t:a}=p(),{mutateAsync:r}=v(s),o=async()=>{await r([e],{onSuccess:()=>{l.success(a("salesChannels.toast.update"))},onError:c=>{l.error(c.message)}})};return t.jsx(j,{groups:[{actions:[{icon:t.jsx(C,{}),label:a("actions.edit"),to:`/products/${e}`}]},{actions:[{icon:t.jsx(P,{}),label:a("actions.remove"),onClick:o}]}]})},Fe=()=>{const s=L(),{id:e}=z(),{sales_channel:a,isPending:r}=S(e,{initialData:s}),{getWidgets:o}=M();return r||!a?t.jsx($,{sections:2,showJSON:!0,showMetadata:!0}):t.jsxs(U,{widgets:{before:o("sales_channel.details.before"),after:o("sales_channel.details.after")},showJSON:!0,showMetadata:!0,data:a,children:[t.jsx(ae,{salesChannel:a}),t.jsx(ne,{salesChannel:a})]})};export{Je as Breadcrumb,Fe as Component,We as loader};