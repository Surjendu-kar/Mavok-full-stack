import{c as g}from"./chunk-BQTJIUCF-B4T0NwAV.js";import{a1 as S,a3 as y,b as v,R as b,aS as w,ar as F,j as e,H as z,a8 as L,t as j,w as r,x as Z,G as E,B as p}from"./index-BxRPZUbt.js";import{K as I}from"./chunk-6HTZNHPT-Bt4ap2B-.js";import{b as o,u as _}from"./chunk-6DAFMWMA-CLcEtfHI.js";import"./chunk-CUT7UDIA-BHmn9zSG.js";import"./prompt-Ad_DCR5S.js";S({name:y().min(1)});var N=({zone:c,fulfillmentSetId:i,locationId:l})=>{const{t:s}=v(),{handleSuccess:a}=_(),t=L({defaultValues:{name:c.name}}),{mutateAsync:m,isPending:u}=g(i,c.id),x=t.handleSubmit(async n=>{await m({name:n.name},{onSuccess:()=>{j.success(s("stockLocations.serviceZones.edit.successToast",{name:n.name})),a(`/settings/locations/${l}`)},onError:d=>{j.error(d.message)}})});return e.jsx(o.Form,{form:t,children:e.jsxs(I,{onSubmit:x,className:"flex size-full flex-col overflow-hidden",children:[e.jsx(o.Body,{className:"flex-1 overflow-auto",children:e.jsxs("div",{className:"flex flex-col gap-y-8",children:[e.jsx("div",{className:"flex flex-col gap-y-4",children:e.jsx(r.Field,{control:t.control,name:"name",render:({field:n})=>e.jsxs(r.Item,{children:[e.jsx(r.Label,{children:s("fields.name")}),e.jsx(r.Control,{children:e.jsx(Z,{...n})}),e.jsx(r.ErrorMessage,{})]})})}),e.jsx(E,{children:s("stockLocations.serviceZones.fields.tip")})]})}),e.jsx(o.Footer,{children:e.jsxs("div",{className:"flex items-center gap-x-2",children:[e.jsx(o.Close,{asChild:!0,children:e.jsx(p,{size:"small",variant:"secondary",children:s("actions.cancel")})}),e.jsx(p,{size:"small",type:"submit",isLoading:u,children:s("actions.save")})]})})]})})},P=()=>{var d,h;const{t:c}=v(),{location_id:i,fset_id:l,zone_id:s}=b(),{stock_location:a,isPending:t,isFetching:m,isError:u,error:x}=w(i,{fields:"*fulfillment_sets.service_zones"}),n=(h=(d=a==null?void 0:a.fulfillment_sets)==null?void 0:d.find(f=>f.id===l))==null?void 0:h.service_zones.find(f=>f.id===s);if(!t&&!m&&!n)throw F({message:`Service zone with ID ${s} was not found`},404);if(u)throw x;return e.jsxs(o,{prev:`/settings/locations/${i}`,children:[e.jsx(o.Header,{children:e.jsx(z,{children:c("stockLocations.serviceZones.edit.header")})}),n&&e.jsx(N,{zone:n,fulfillmentSetId:l,locationId:i})]})};export{P as Component};
