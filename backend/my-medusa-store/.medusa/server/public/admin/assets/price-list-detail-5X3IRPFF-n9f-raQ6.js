import{L as Q}from"./chunk-I3VB6NM2-MeV93mlH.js";import{u as F}from"./chunk-QR72ESDG-BVN3Ldpg.js";import{g as H}from"./chunk-G2J2T2QU-DG3uwQuY.js";import{D as I}from"./chunk-QV6CTQOZ-CFU8kTgw.js";import{u as M}from"./chunk-RJSD5KRU-BfsVzOGX.js";import{dR as w,j as e,q as $,R as J,a as K,S as W,dS as Y,s as G,b as u,H as j,A as m,dQ as X,aF as Z,T as d,u as U,r as L,e as V,k as ee,dT as C,W as se,t as p}from"./index-BxRPZUbt.js";import{u as te,a as ie}from"./chunk-ZE4FSVPB-2qZwfadS.js";import{T as g}from"./chunk-2RQLKDBF-DppJ2vsa.js";import{u as re,D as ae}from"./chunk-OYHBAUAW-Bh910uOp.js";import"./lodash-Wa3tNvWF.js";import"./chunk-FZFMTVUS-B6epN2ER.js";import"./chunk-BNLHRJ2A-Cy9oezEa.js";import"./chunk-KHOKHZC6-BT2W526V.js";import{P as x}from"./pencil-square-DPRnN69u.js";import{T}from"./trash-D7gRgiti.js";import{u as k}from"./use-prompt-CljjOm9N.js";import{C as y}from"./container-C8-EYVG6.js";import{S as oe}from"./status-badge-SdCm7goQ.js";import{C as P}from"./checkbox-CGs03nqI.js";import{c as ce}from"./index-BpYtoVSX.js";import"./chunk-6GU6IDUA-CDc7wW5L.js";import"./chunk-IVEEMMLZ-CPRLM5_J.js";import"./format-CSM4n_jz.js";import"./chunk-RERSP5B2-CpYkKCYP.js";import"./chunk-ADOCJB6L-BAtYHWA7.js";import"./chunk-P3UUX2T6-BqASRlOM.js";import"./chunk-C76H5USB-C4KynttQ.js";import"./Trans-Djefil4l.js";import"./x-mark-mini-CdT8Gfml.js";import"./check-CgVhTlWH.js";import"./chunk-YEDAFXMB-Q_4fYbM3.js";import"./chunk-AOFGTNG6-D4HQXs0t.js";import"./chunk-WX2SMNCD-CYNKb9PK.js";import"./plus-mini-CSilrpvR.js";import"./command-bar-Bfh-9oY8.js";import"./index-B2CyCadw.js";import"./date-picker-BUKrjaEd.js";import"./clsx-B-dksMZM.js";import"./popover-DP_copnG.js";import"./triangle-left-mini-BVg8f3e8.js";import"./prompt-Ad_DCR5S.js";var ts=i=>{const{id:s}=i.params||{},{price_list:t}=w(s,void 0,{initialData:i.data,enabled:!!s});return t?e.jsx("span",{children:t.title}):null},ne=i=>({queryKey:Y.detail(i),queryFn:async()=>G.admin.priceList.retrieve(i)}),is=async({params:i})=>{const s=i.id,t=ne(s);return $.ensureQueryData(t)},le=({priceList:i})=>{const{t:s}=u();return e.jsxs(y,{className:"flex flex-col gap-y-4",children:[e.jsxs("div",{className:"flex items-center justify-between",children:[e.jsxs("div",{children:[e.jsx(j,{level:"h2",children:s("priceLists.configuration.header")}),e.jsx(de,{priceList:i})]}),e.jsx(m,{groups:[{actions:[{label:s("actions.edit"),to:"configuration",icon:e.jsx(x,{})}]}]})]}),e.jsx(I,{endsAt:i.ends_at,startsAt:i.starts_at,showTime:!0})]})},de=({priceList:i})=>{const{t:s}=u(),t=i.rules.customer_group_id,{customer_groups:r,isPending:a,isError:o,error:n}=X({id:t},{enabled:!!(t!=null&&t.length)});if(o)throw n;return t!=null&&t.length?a||!r?e.jsx(Z,{className:"h-5 w-full max-w-48"}):e.jsxs("div",{className:"txt-small-plus text-ui-fg-muted flex items-center gap-x-1.5",children:[e.jsx("span",{className:"text-ui-fg-subtle",children:s("priceLists.fields.customerAvailability.attribute")}),e.jsx("span",{children:"·"}),e.jsx(Q,{list:r.map(c=>c.name),n:1,className:"txt-small-plus text-ui-fg-muted"})]}):null},ue=({priceList:i})=>{var c;const{t:s}=u(),t=((c=i.prices)==null?void 0:c.length)||0,{color:r,text:a}=H(s,i),o=F({priceList:i}),n=i.type==="sale"?s("priceLists.fields.type.options.sale.label"):s("priceLists.fields.type.options.override.label");return e.jsxs(y,{className:"divide-y p-0",children:[e.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[e.jsx(j,{children:i.title}),e.jsxs("div",{className:"flex items-center gap-x-4",children:[e.jsx(oe,{color:r,children:a}),e.jsx(m,{groups:[{actions:[{label:s("actions.edit"),to:"edit",icon:e.jsx(x,{})}]},{actions:[{label:s("actions.delete"),onClick:o,icon:e.jsx(T,{})}]}]})]})]}),e.jsxs("div",{className:"text-ui-fg-subtle grid grid-cols-2 items-center px-6 py-4",children:[e.jsx(d,{leading:"compact",size:"small",weight:"plus",children:s("fields.type")}),e.jsx(d,{size:"small",className:"text-pretty",children:n})]}),e.jsxs("div",{className:"text-ui-fg-subtle grid grid-cols-2 items-center px-6 py-4",children:[e.jsx(d,{leading:"compact",size:"small",weight:"plus",children:s("fields.description")}),e.jsx(d,{size:"small",className:"text-pretty",children:i.description})]}),e.jsxs("div",{className:"text-ui-fg-subtle grid grid-cols-2 items-center px-6 py-4",children:[e.jsx(d,{leading:"compact",size:"small",weight:"plus",children:s("priceLists.fields.priceOverrides.label")}),e.jsx(d,{size:"small",className:"text-pretty",children:t||"-"})]})]})},f=10,h="p",pe=({priceList:i})=>{const{t:s}=u(),t=U(),r=k(),[a,o]=L.useState({}),{searchParams:n,raw:c}=te({pageSize:f,prefix:h}),{products:N,count:b,isLoading:D,isError:_,error:A}=V({...n,price_list_id:[i.id]},{placeholderData:ee}),E=ie(),v=xe(i),{mutateAsync:R}=C(i.id),{table:z}=re({data:N||[],count:b,columns:v,enablePagination:!0,enableRowSelection:!0,pageSize:f,getRowId:l=>l.id,rowSelection:{state:a,updater:o},prefix:h}),O=async()=>{await r({title:s("general.areYouSure"),description:s("priceLists.products.delete.confirmation",{count:Object.keys(a).length}),confirmText:s("actions.delete"),cancelText:s("actions.cancel")})&&R({remove:Object.keys(a)},{onSuccess:()=>{p.success(s("priceLists.products.delete.successToast",{count:Object.keys(a).length})),o({})},onError:B=>{p.error(B.message)}})},q=async()=>{const l=Object.keys(a).join(",");t(`products/edit?ids[]=${l}`)};if(_)throw A;return e.jsxs(y,{className:"divide-y p-0",children:[e.jsxs("div",{className:"flex items-center justify-between px-6 py-4",children:[e.jsx(j,{children:s("priceLists.products.header")}),e.jsx(m,{groups:[{actions:[{label:s("priceLists.products.actions.addProducts"),to:"products/add",icon:e.jsx(se,{})},{label:s("priceLists.products.actions.editPrices"),to:"products/edit",icon:e.jsx(x,{})}]}]})]}),e.jsx(ae,{table:z,filters:E,columns:v,count:b,pageSize:f,isLoading:D,navigateTo:l=>`/products/${l.original.id}`,orderBy:[{key:"title",label:s("fields.title")},{key:"created_at",label:s("fields.createdAt")},{key:"updated_at",label:s("fields.updatedAt")}],commands:[{action:q,label:s("actions.edit"),shortcut:"e"},{action:O,label:s("actions.delete"),shortcut:"d"}],pagination:!0,search:!0,prefix:h,queryObject:c})]})},me=({product:i,priceList:s})=>{const{t}=u(),r=k(),{mutateAsync:a}=C(s.id),o=async()=>{await r({title:t("general.areYouSure"),description:t("priceLists.products.delete.confirmation",{count:1}),confirmText:t("actions.delete"),cancelText:t("actions.cancel")})&&a({remove:[i.id]},{onSuccess:()=>{p.success(t("priceLists.products.delete.successToast",{count:1}))},onError:c=>{p.error(c.message)}})};return e.jsx(m,{groups:[{actions:[{icon:e.jsx(x,{}),label:t("priceLists.products.actions.editPrices"),to:`products/edit?ids[]=${i.id}`}]},{actions:[{icon:e.jsx(T,{}),label:t("actions.remove"),onClick:o}]}]})},S=ce(),xe=i=>{const s=M();return L.useMemo(()=>[S.display({id:"select",header:({table:t})=>e.jsx(P,{checked:t.getIsSomePageRowsSelected()?"indeterminate":t.getIsAllPageRowsSelected(),onCheckedChange:r=>t.toggleAllPageRowsSelected(!!r)}),cell:({row:t})=>e.jsx(P,{checked:t.getIsSelected(),onCheckedChange:r=>t.toggleSelected(!!r),onClick:r=>{r.stopPropagation()}})}),...s,S.display({id:"actions",cell:({row:t})=>e.jsx(me,{product:t.original,priceList:i})})],[s,i])},rs=()=>{const{id:i}=J(),{price_list:s,isLoading:t,isError:r,error:a}=w(i),{getWidgets:o}=K();if(t||!s)return e.jsx(W,{mainSections:2,sidebarSections:1,showJSON:!0});if(r)throw a;return e.jsxs(g,{widgets:{after:o("price_list.details.after"),before:o("price_list.details.before"),sideAfter:o("price_list.details.side.after"),sideBefore:o("price_list.details.side.before")},data:s,showJSON:!0,children:[e.jsxs(g.Main,{children:[e.jsx(ue,{priceList:s}),e.jsx(pe,{priceList:s})]}),e.jsx(g.Sidebar,{children:e.jsx(le,{priceList:s})})]})};export{ts as Breadcrumb,rs as Component,is as loader};
