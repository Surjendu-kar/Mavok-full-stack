import{a as y}from"./chunk-R2O6QX4D-CX21ziz_.js";import{S}from"./chunk-PYIO3TDQ-D8Zv8hXV.js";import{u as v}from"./chunk-6CNRNROJ-CjvpR1EB.js";import{C}from"./chunk-W6N53UNG-CiS_KMZl.js";import{a1 as L,a3 as g,eQ as O,a4 as E,b as _,R as T,ar as F,j as e,H as k,s as I,a8 as w,a9 as N,t as j,w as o,x as R,D as V,B as b}from"./index-BxRPZUbt.js";import{u as B,c as P}from"./chunk-CUT7UDIA-BHmn9zSG.js";import{S as D}from"./chunk-JLD5AXG6-DykmSJFd.js";import{K as M}from"./chunk-6HTZNHPT-Bt4ap2B-.js";import{b as d,u as q}from"./chunk-6DAFMWMA-CLcEtfHI.js";import{R as x}from"./radio-group-Byv2FMeh.js";import"./x-mark-mini-CdT8Gfml.js";import"./triangles-mini-tCJv45fO.js";import"./plus-mini-CSilrpvR.js";import"./prompt-Ad_DCR5S.js";function H(l,n){const s={};return n.forEach(a=>{a in l&&(s[a]=l[a])}),s}var K=L({name:g().min(1),price_type:O(S),enabled_in_store:E().optional(),shipping_profile_id:g()}),$=({locationId:l,shippingOption:n})=>{const{t:s}=_(),{handleSuccess:a}=q(),p=v({queryFn:i=>I.admin.shippingProfile.list(i),queryKey:["shipping_profiles"],getOptions:i=>i.shipping_profiles.map(c=>({label:c.name,value:c.id})),defaultValue:n.shipping_profile_id}),t=w({defaultValues:{name:n.name,price_type:n.price_type,enabled_in_store:y(n),shipping_profile_id:n.shipping_profile_id},resolver:N(K)}),{mutateAsync:h,isPending:u}=P(n.id),m=t.handleSubmit(async i=>{const c=n.rules.map(r=>({...H(r,["id","attribute","operator","value"])})),f=c.find(r=>r.attribute==="enabled_in_store");f?f.value=i.enabled_in_store?"true":"false":c.push({value:i.enabled_in_store?"true":"false",attribute:"enabled_in_store",operator:"eq"}),await h({name:i.name,price_type:i.price_type,shipping_profile_id:i.shipping_profile_id,rules:c},{onSuccess:({shipping_option:r})=>{j.success(s("stockLocations.shippingOptions.edit.successToast",{name:r.name})),a(`/settings/locations/${l}`)},onError:r=>{j.error(r.message)}})});return e.jsx(d.Form,{form:t,children:e.jsxs(M,{onSubmit:m,className:"flex flex-1 flex-col",children:[e.jsx(d.Body,{children:e.jsx("div",{className:"flex flex-col gap-y-8",children:e.jsxs("div",{className:"flex flex-col gap-y-8",children:[e.jsx(o.Field,{control:t.control,name:"price_type",render:({field:i})=>e.jsxs(o.Item,{children:[e.jsx(o.Label,{children:s("stockLocations.shippingOptions.fields.priceType.label")}),e.jsx(o.Control,{children:e.jsxs(x,{...i,onValueChange:i.onChange,children:[e.jsx(x.ChoiceBox,{className:"flex-1",value:"flat",label:s("stockLocations.shippingOptions.fields.priceType.options.fixed.label"),description:s("stockLocations.shippingOptions.fields.priceType.options.fixed.hint")}),e.jsx(x.ChoiceBox,{className:"flex-1",value:"calculated",label:s("stockLocations.shippingOptions.fields.priceType.options.calculated.label"),description:s("stockLocations.shippingOptions.fields.priceType.options.calculated.hint")})]})}),e.jsx(o.ErrorMessage,{})]})}),e.jsxs("div",{className:"grid gap-y-4",children:[e.jsx(o.Field,{control:t.control,name:"name",render:({field:i})=>e.jsxs(o.Item,{children:[e.jsx(o.Label,{children:s("fields.name")}),e.jsx(o.Control,{children:e.jsx(R,{...i})}),e.jsx(o.ErrorMessage,{})]})}),e.jsx(o.Field,{control:t.control,name:"shipping_profile_id",render:({field:i})=>e.jsxs(o.Item,{children:[e.jsx(o.Label,{children:s("stockLocations.shippingOptions.fields.profile")}),e.jsx(o.Control,{children:e.jsx(C,{...i,options:p.options,searchValue:p.searchValue,onSearchValueChange:p.onSearchValueChange,disabled:p.disabled})}),e.jsx(o.ErrorMessage,{})]})})]}),e.jsx(V,{}),e.jsx(D,{control:t.control,name:"enabled_in_store",label:s("stockLocations.shippingOptions.fields.enableInStore.label"),description:s("stockLocations.shippingOptions.fields.enableInStore.hint")})]})})}),e.jsx(d.Footer,{children:e.jsxs("div",{className:"flex items-center gap-x-2",children:[e.jsx(d.Close,{asChild:!0,children:e.jsx(b,{size:"small",variant:"secondary",children:s("actions.cancel")})}),e.jsx(b,{size:"small",type:"submit",isLoading:u,children:s("actions.save")})]})})]})})},ne=()=>{const{t:l}=_(),{location_id:n,so_id:s}=T(),{shipping_options:a,isPending:p,isFetching:t,isError:h,error:u}=B({id:s}),m=a==null?void 0:a.find(i=>i.id===s);if(!p&&!t&&!m)throw F({message:`Shipping option with ID ${s} was not found`},404);if(h)throw u;return e.jsxs(d,{children:[e.jsx(d.Header,{children:e.jsx(k,{children:l("stockLocations.shippingOptions.edit.header")})}),m&&e.jsx($,{shippingOption:m,locationId:n})]})};export{ne as Component};
