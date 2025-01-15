import{a5 as c,b as f,R as g,dR as L,j as e,H as E,a8 as C,a9 as F,dU as R,t as j,w as s,x as I,B as h}from"./index-BxRPZUbt.js";import{K as S}from"./chunk-6HTZNHPT-Bt4ap2B-.js";import{b as a,u as w}from"./chunk-6DAFMWMA-CLcEtfHI.js";import{R as u}from"./radio-group-Byv2FMeh.js";import{S as n}from"./select-TNgs-b-i.js";import{T}from"./textarea-DDazutnW.js";import"./prompt-Ad_DCR5S.js";import"./triangles-mini-tCJv45fO.js";import"./check-CgVhTlWH.js";var v=(i=>(i.ACTIVE="active",i.DRAFT="draft",i))(v||{}),y=(i=>(i.SALE="sale",i.OVERRIDE="override",i))(y||{}),V=c.object({status:c.nativeEnum(v),type:c.nativeEnum(y),title:c.string().min(1),description:c.string().min(1)}),B=({priceList:i})=>{const{t:r}=f(),{handleSuccess:d}=w(),l=C({defaultValues:{type:i.type,title:i.title,description:i.description,status:i.status},resolver:F(V)}),{mutateAsync:x,isPending:m}=R(i.id),p=l.handleSubmit(async t=>{await x(t,{onSuccess:({price_list:o})=>{j.success(r("priceLists.edit.successToast",{title:o.title})),d()},onError:o=>{j.error(o.message)}})});return e.jsx(a.Form,{form:l,children:e.jsxs(S,{className:"flex flex-1 flex-col overflow-hidden",onSubmit:p,children:[e.jsxs(a.Body,{className:"flex flex-1 flex-col gap-y-6 overflow-auto",children:[e.jsx(s.Field,{control:l.control,name:"type",render:({field:{onChange:t,...o}})=>e.jsxs(s.Item,{children:[e.jsxs("div",{children:[e.jsx(s.Label,{children:r("priceLists.fields.type.label")}),e.jsx(s.Hint,{children:r("priceLists.fields.type.hint")})]}),e.jsx(s.Control,{children:e.jsxs(u,{...o,onValueChange:t,children:[e.jsx(u.ChoiceBox,{value:"sale",label:r("priceLists.fields.type.options.sale.label"),description:r("priceLists.fields.type.options.sale.description")}),e.jsx(u.ChoiceBox,{value:"override",label:r("priceLists.fields.type.options.override.label"),description:r("priceLists.fields.type.options.override.description")})]})}),e.jsx(s.ErrorMessage,{})]})}),e.jsxs("div",{className:"flex flex-col gap-y-4",children:[e.jsx(s.Field,{control:l.control,name:"title",render:({field:t})=>e.jsxs(s.Item,{children:[e.jsx(s.Label,{children:r("fields.title")}),e.jsx(s.Control,{children:e.jsx(I,{...t})}),e.jsx(s.ErrorMessage,{})]})}),e.jsx(s.Field,{control:l.control,name:"status",render:({field:{onChange:t,ref:o,...b}})=>e.jsxs(s.Item,{children:[e.jsx(s.Label,{children:r("priceLists.fields.status.label")}),e.jsx(s.Control,{children:e.jsxs(n,{...b,onValueChange:t,children:[e.jsx(n.Trigger,{ref:o,children:e.jsx(n.Value,{})}),e.jsxs(n.Content,{children:[e.jsx(n.Item,{value:"active",children:r("priceLists.fields.status.options.active")}),e.jsx(n.Item,{value:"draft",children:r("priceLists.fields.status.options.draft")})]})]})}),e.jsx(s.ErrorMessage,{})]})}),e.jsx(s.Field,{control:l.control,name:"description",render:({field:t})=>e.jsxs(s.Item,{children:[e.jsx(s.Label,{children:r("fields.description")}),e.jsx(s.Control,{children:e.jsx(T,{...t})}),e.jsx(s.ErrorMessage,{})]})})]})]}),e.jsx(a.Footer,{className:"shrink-0",children:e.jsxs("div",{className:"flex items-center justify-end gap-x-2",children:[e.jsx(a.Close,{asChild:!0,children:e.jsx(h,{size:"small",variant:"secondary",children:r("actions.cancel")})}),e.jsx(h,{size:"small",type:"submit",isLoading:m,children:r("actions.save")})]})})]})})},k=()=>{const{t:i}=f(),{id:r}=g(),{price_list:d,isLoading:l,isError:x,error:m}=L(r),p=!l&&d;if(x)throw m;return e.jsxs(a,{children:[e.jsx(a.Header,{children:e.jsx(E,{children:i("priceLists.edit.header")})}),p&&e.jsx(B,{priceList:d})]})};export{k as Component};
