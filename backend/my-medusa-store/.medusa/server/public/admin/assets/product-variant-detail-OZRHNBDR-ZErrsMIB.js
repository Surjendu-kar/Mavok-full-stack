import{L as q}from"./chunk-6WKBBTKM-rfdrmIkI.js";import{g as D}from"./chunk-FSMQADBD-Dkr3W4bN.js";import{V as f}from"./chunk-EUTK2A3J-CZpwcbuN.js";import{S as N}from"./chunk-LFLGEXIG-D7klchP9.js";import{T as y}from"./chunk-2RQLKDBF-DppJ2vsa.js";import{P as p}from"./chunk-P3UUX2T6-BqASRlOM.js";import{u as P,D as T}from"./chunk-OYHBAUAW-Bh910uOp.js";import{a7 as w,j as e,q as I,d as V,R as k,a as A,S as B,au as z,s as E,b as u,u as M,$ as L,H as h,A as v,Y as R,a0 as _,r as S,av as K,B as $}from"./index-BxRPZUbt.js";import"./lodash-Wa3tNvWF.js";import{N as H}from"./chunk-WX2SMNCD-CYNKb9PK.js";import"./chunk-FZFMTVUS-B6epN2ER.js";import"./chunk-BNLHRJ2A-Cy9oezEa.js";import"./chunk-KHOKHZC6-BT2W526V.js";import{C}from"./component-BBKzMZXX.js";import{P as O}from"./pencil-square-DPRnN69u.js";import{T as Q}from"./trash-D7gRgiti.js";import{u as F}from"./use-prompt-CljjOm9N.js";import{C as j}from"./container-C8-EYVG6.js";import{c as G}from"./index-BpYtoVSX.js";import"./chunk-MWVM4TYO-bKUcYSnf.js";import"./Trans-Djefil4l.js";import"./x-mark-mini-CdT8Gfml.js";import"./check-CgVhTlWH.js";import"./chunk-YEDAFXMB-Q_4fYbM3.js";import"./chunk-AOFGTNG6-D4HQXs0t.js";import"./command-bar-Bfh-9oY8.js";import"./index-B2CyCadw.js";import"./plus-mini-CSilrpvR.js";import"./chunk-IVEEMMLZ-CPRLM5_J.js";import"./format-CSM4n_jz.js";import"./date-picker-BUKrjaEd.js";import"./clsx-B-dksMZM.js";import"./popover-DP_copnG.js";import"./triangle-left-mini-BVg8f3e8.js";import"./prompt-Ad_DCR5S.js";var ze=t=>{const{id:s,variant_id:a}=t.params||{},{variant:i}=w(s,a,{fields:f},{initialData:t.data,enabled:!!s&&!!a});return i?e.jsx("span",{children:i.title}):null},J=(t,s)=>({queryKey:z.detail(s,{fields:f}),queryFn:async()=>E.admin.product.retrieveVariant(t,s,{fields:f})}),Ee=async({params:t})=>{const s=t.id,a=t.variant_id,i=J(s,a);return I.ensureQueryData(i)};function W({variant:t}){var c,d;const{t:s}=u(),a=F(),i=M(),r=((c=t.inventory)==null?void 0:c.length)>1,{mutateAsync:o}=L(t.product_id,t.id),l=async()=>{await a({title:s("general.areYouSure"),description:s("products.variant.deleteWarning",{title:t.title}),confirmText:s("actions.delete"),cancelText:s("actions.cancel")})&&await o(void 0,{onSuccess:()=>{i("..",{replace:!0})}})};return e.jsxs(j,{className:"divide-y p-0",children:[e.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[e.jsxs("div",{children:[e.jsxs("div",{className:"flex items-center gap-2",children:[e.jsx(h,{children:t.title}),r&&e.jsx("span",{className:"text-ui-fg-muted font-normal",children:e.jsx(C,{})})]}),e.jsx("span",{className:"text-ui-fg-subtle txt-small mt-2",children:s("labels.productVariant")})]}),e.jsx("div",{className:"flex items-center gap-x-4",children:e.jsx(v,{groups:[{actions:[{label:s("actions.edit"),to:"edit",icon:e.jsx(O,{})}]},{actions:[{label:s("actions.delete"),onClick:l,icon:e.jsx(Q,{})}]}]})})]}),e.jsx(N,{title:s("fields.sku"),value:t.sku}),(d=t.options)==null?void 0:d.map(n=>{var x;return e.jsx(N,{title:(x=n.option)==null?void 0:x.title,value:e.jsx(R,{size:"2xsmall",children:n.value})},n.id)})]})}var Y=({item:t})=>{const{t:s}=u();return e.jsx(v,{groups:[{actions:[{icon:e.jsx(_,{}),label:s("products.variant.inventory.navigateToItem"),to:`/inventory/${t.id}`}]}]})},m=G(),U=()=>{const{t}=u();return S.useMemo(()=>[m.accessor("title",{header:t("fields.title"),cell:({getValue:s})=>{const a=s();return a?e.jsx("div",{className:"flex size-full items-center overflow-hidden",children:e.jsx("span",{className:"truncate",children:a})}):e.jsx(p,{})}}),m.accessor("sku",{header:t("fields.sku"),cell:({getValue:s})=>{const a=s();return a?e.jsx("div",{className:"flex size-full items-center overflow-hidden",children:e.jsx("span",{className:"truncate",children:a})}):e.jsx(p,{})}}),m.accessor("required_quantity",{header:t("fields.requiredQuantity"),cell:({getValue:s})=>{const a=s();return Number.isNaN(a)?e.jsx(p,{}):e.jsx("div",{className:"flex size-full items-center overflow-hidden",children:e.jsx("span",{className:"truncate",children:a})})}}),m.display({id:"inventory_quantity",header:t("fields.inventory"),cell:({getValue:s,row:{original:a}})=>{var o;if(!((o=a.location_levels)!=null&&o.length))return e.jsx(p,{});let i=0,r=0;return a.location_levels.forEach(l=>{i+=l.available_quantity,r+=1}),e.jsx("div",{className:"flex size-full items-center overflow-hidden",children:e.jsx("span",{className:"truncate",children:t("products.variant.tableItem",{availableCount:i,locationCount:r,count:r})})})}}),m.display({id:"actions",cell:({row:s})=>e.jsx(Y,{item:s.original})})],[t])},b=20;function Z({inventoryItems:t}){const{t:s}=u(),a=U(),{table:i}=P({data:t??[],columns:a,count:t.length,enablePagination:!0,getRowId:o=>o.id,pageSize:b}),r=t.length>1;return e.jsxs(j,{className:"divide-y p-0",children:[e.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[e.jsx("div",{className:"flex items-center gap-2",children:e.jsx(h,{level:"h2",children:s("fields.inventoryItems")})}),e.jsx("div",{className:"flex items-center gap-x-4",children:e.jsx(v,{groups:[{actions:[{label:s(r?"products.variant.inventory.manageKit":"products.variant.inventory.manageItems"),to:"manage-items",icon:r?e.jsx(C,{}):e.jsx(_,{})}]}]})})]}),e.jsx(T,{table:i,columns:a,pageSize:b,count:t.length,navigateTo:o=>`/inventory/${o.id}`})]})}function X(){const{t}=u();return e.jsx(j,{className:"divide-y p-0",children:e.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[e.jsxs("div",{className:"flex flex-col gap-1",children:[e.jsx(h,{level:"h2",children:t("fields.inventoryItems")}),e.jsx("span",{className:"txt-small text-ui-fg-subtle",children:t("products.variant.inventory.notManagedDesc")})]}),e.jsx("div",{className:"flex items-center gap-x-4",children:e.jsx(q,{to:"edit",children:t("products.variant.edit.header")})})]})})}function ee({variant:t}){var d;const{t:s}=u(),a=(d=t.prices)==null?void 0:d.filter(n=>!Object.keys(n.rules||{}).length).sort((n,x)=>{var g;return(g=n.currency_code)==null?void 0:g.localeCompare(x.currency_code)}),i=!!(a!=null&&a.length),[r,o]=S.useState(3),l=a==null?void 0:a.slice(0,r),c=()=>{o(r+3)};return e.jsxs(j,{className:"flex flex-col divide-y p-0",children:[e.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[e.jsx(h,{level:"h2",children:s("labels.prices")}),e.jsx(v,{groups:[{actions:[{label:s("actions.edit"),to:`/products/${t.product_id}/variants/${t.id}/prices`,icon:e.jsx(K,{})}]}]})]}),!i&&e.jsx(H,{className:"h-60"}),l==null?void 0:l.map(n=>e.jsxs("div",{className:"txt-small text-ui-fg-subtle flex justify-between px-6 py-4",children:[e.jsx("span",{className:"font-medium",children:n.currency_code.toUpperCase()}),e.jsx("span",{children:D(n.amount,n.currency_code)})]},n.id)),i&&e.jsxs("div",{className:"txt-small text-ui-fg-subtle flex items-center justify-between px-6 py-4",children:[e.jsx("span",{className:"font-medium",children:s("products.variant.pricesPagination",{total:a.length,current:Math.min(r,a.length)})}),e.jsx($,{onClick:c,disabled:r>=a.length,className:"-mr-3 text-blue-500",variant:"transparent",children:s("actions.showMore")})]})]})}var Me=()=>{const t=V(),{id:s,variant_id:a}=k(),{variant:i,isLoading:r,isError:o,error:l}=w(s,a,{fields:f},{initialData:t}),{getWidgets:c}=A();if(r||!i)return e.jsx(B,{mainSections:2,sidebarSections:1,showJSON:!0,showMetadata:!0});if(o)throw l;return e.jsxs(y,{data:i,hasOutlet:!0,showJSON:!0,showMetadata:!0,widgets:{after:c("product_variant.details.after"),before:c("product_variant.details.before"),sideAfter:c("product_variant.details.side.after"),sideBefore:c("product_variant.details.side.before")},children:[e.jsxs(y.Main,{children:[e.jsx(W,{variant:i}),i.manage_inventory?e.jsx(Z,{inventoryItems:i.inventory_items.map(d=>({...d.inventory,required_quantity:d.required_quantity,variant:i}))}):e.jsx(X,{})]}),e.jsx(y.Sidebar,{children:e.jsx(ee,{variant:i})})]})};export{ze as Breadcrumb,Me as Component,Ee as loader};
