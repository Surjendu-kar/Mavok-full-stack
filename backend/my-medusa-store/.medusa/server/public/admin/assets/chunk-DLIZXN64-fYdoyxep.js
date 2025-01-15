import{V as l}from"./chunk-F6ZOHZVB-P-17eaB_.js";import{C as h}from"./chunk-RX6DOG6Q-CK2NLGrz.js";import{a1 as c,a3 as t,dt as o,af as x,a2 as y,b as j,du as _,a8 as b,a9 as C,t as m,j as e,B as d}from"./index-BxRPZUbt.js";import{K as v}from"./chunk-6HTZNHPT-Bt4ap2B-.js";import{u as F,R as a}from"./chunk-6DAFMWMA-CLcEtfHI.js";var T={name:"",description:"",campaign_identifier:"",starts_at:null,ends_at:null,budget:{type:"usage",currency_code:null,limit:null}},S=c({name:t().min(1),description:t().optional(),campaign_identifier:t().min(1),starts_at:o().nullable(),ends_at:o().nullable(),budget:c({limit:x().min(0).nullish(),type:y(["spend","usage"]),currency_code:t().nullish()})}),V=()=>{const{t:i}=j(),{handleSuccess:u}=F(),{mutateAsync:p,isPending:g}=_(),r=b({defaultValues:T,resolver:C(S)}),f=r.handleSubmit(async s=>{await p({name:s.name,description:s.description,campaign_identifier:s.campaign_identifier,starts_at:s.starts_at,ends_at:s.ends_at,budget:{type:s.budget.type,limit:s.budget.limit?s.budget.limit:void 0,currency_code:s.budget.currency_code}},{onSuccess:({campaign:n})=>{m.success(i("campaigns.create.successToast",{name:n.name})),u(`/campaigns/${n.id}`)},onError:n=>{m.error(n.message)}})});return e.jsx(a.Form,{form:r,children:e.jsxs(v,{onSubmit:f,className:"flex size-full flex-col overflow-hidden",children:[e.jsxs(a.Header,{children:[e.jsx(a.Title,{asChild:!0,children:e.jsx(l,{children:i("campaigns.create.title")})}),e.jsx(a.Description,{asChild:!0,children:e.jsx(l,{children:i("campaigns.create.description")})})]}),e.jsx(a.Body,{className:"flex size-full flex-col items-center overflow-auto py-16",children:e.jsx(h,{form:r})}),e.jsx(a.Footer,{children:e.jsxs("div",{className:"flex items-center justify-end gap-x-2",children:[e.jsx(a.Close,{asChild:!0,children:e.jsx(d,{size:"small",variant:"secondary",children:i("actions.cancel")})}),e.jsx(d,{size:"small",variant:"primary",type:"submit",isLoading:g,children:i("actions.create")})]})})]})})};export{S as C,T as D,V as a};
