import{R as I}from"./chunk-ZSJ5QHFM-BHOcInk1.js";import{C as me,D as Z}from"./chunk-DLIZXN64-fYdoyxep.js";import{a5 as i,j as e,r as j,b as pe,a8 as ue,a9 as he,dn as fe,t as q,v as g,dp as xe,w as o,H as ge,Y as ye,m as h,x as ee,T as A,D as B,B as E}from"./index-BxRPZUbt.js";import{D as _e}from"./chunk-YRY2CZ6I-DSQp4bct.js";import{A as je}from"./chunk-C25I7LMN-BiqznMD1.js";import{g as be}from"./chunk-MWVM4TYO-bKUcYSnf.js";import"./chunk-W6N53UNG-CiS_KMZl.js";import{K as ve}from"./chunk-6HTZNHPT-Bt4ap2B-.js";import{R as y,u as Ce}from"./chunk-6DAFMWMA-CLcEtfHI.js";import{T as z}from"./Trans-Djefil4l.js";import{P as f}from"./progress-tabs-DlI2IPca.js";import{R as d}from"./radio-group-Byv2FMeh.js";import{A as Ne}from"./alert-BGVlciuX.js";import{C as we}from"./currency-input-CfQhtpmh.js";import"./x-mark-mini-CdT8Gfml.js";import"./select-TNgs-b-i.js";import"./triangles-mini-tCJv45fO.js";import"./check-CgVhTlWH.js";import"./chunk-F6ZOHZVB-P-17eaB_.js";import"./chunk-RX6DOG6Q-CK2NLGrz.js";import"./textarea-DDazutnW.js";import"./date-picker-BUKrjaEd.js";import"./clsx-B-dksMZM.js";import"./popover-DP_copnG.js";import"./index-B2CyCadw.js";import"./triangle-left-mini-BVg8f3e8.js";import"./index.esm-BVvMJMXx.js";import"./plus-mini-CSilrpvR.js";import"./prompt-Ad_DCR5S.js";var M=i.array(i.object({id:i.string().optional(),attribute:i.string().min(1,{message:"Required field"}),operator:i.string().min(1,{message:"Required field"}),values:i.union([i.number().min(1,{message:"Required field"}),i.string().min(1,{message:"Required field"}),i.array(i.string()).min(1,{message:"Required field"})]),required:i.boolean().optional(),disguised:i.boolean().optional(),field_type:i.string().optional()})),Fe=i.object({template_id:i.string().optional(),campaign_id:i.string().optional(),campaign_choice:i.enum(["none","existing","new"]).optional(),is_automatic:i.string().toLowerCase(),code:i.string().min(1),type:i.enum(["buyget","standard"]),rules:M,application_method:i.object({allocation:i.enum(["each","across"]),value:i.number().min(0),currency_code:i.string().optional(),max_quantity:i.number().optional().nullable(),target_rules:M,buy_rules:M,type:i.enum(["fixed","percentage"]),target_type:i.enum(["order","shipping_methods","items"])}),campaign:me.optional()}).refine(x=>x.application_method.allocation==="across"?!0:x.application_method.allocation==="each"&&typeof x.application_method.max_quantity=="number",{path:["application_method.max_quantity"],message:"required field"}),b=["type","application_method.type","application_method.allocation"],P=[{id:"amount_off_products",type:"standard",title:"Amount off products",description:"Discount specific products or collection of products",hiddenFields:[...b],defaults:{is_automatic:"false",type:"standard",application_method:{allocation:"each",target_type:"items",type:"fixed"}}},{id:"amount_off_order",type:"standard",title:"Amount off order",description:"Discounts the total order amount",hiddenFields:[...b],defaults:{is_automatic:"false",type:"standard",application_method:{allocation:"across",target_type:"order",type:"fixed"}}},{id:"percentage_off_product",type:"standard",title:"Percentage off product",description:"Discounts a percentage off selected products",hiddenFields:[...b],defaults:{is_automatic:"false",type:"standard",application_method:{allocation:"each",target_type:"items",type:"percentage"}}},{id:"percentage_off_order",type:"standard",title:"Percentage off order",description:"Discounts a percentage of the total order amount",hiddenFields:[...b],defaults:{is_automatic:"false",type:"standard",application_method:{allocation:"across",target_type:"order",type:"percentage"}}},{id:"buy_get",type:"buy_get",title:"Buy X Get Y",description:"Buy X product(s), get Y product(s)",hiddenFields:[...b,"application_method.value"],defaults:{is_automatic:"false",type:"buyget",application_method:{type:"percentage",value:100,apply_to_quantity:1,max_quantity:1}}}],te={campaign_id:void 0,template_id:P[0].id,campaign_choice:"none",is_automatic:"false",code:"",type:"standard",rules:[],application_method:{allocation:"each",type:"fixed",target_type:"items",max_quantity:1,target_rules:[],buy_rules:[]},campaign:void 0},Re=()=>{var U,$,G,Y;const[x,v]=j.useState("type"),[F,C]=j.useState({type:"in-progress",promotion:"not-started",campaign:"not-started"}),{t:a}=pe(),{handleSuccess:oe}=Ce(),s=ue({defaultValues:te,resolver:he(Fe)}),{setValue:m,reset:L,getValues:k}=s,{mutateAsync:ae}=fe(),se=s.handleSubmit(async t=>{const{campaign_choice:r,is_automatic:n,template_id:p,application_method:u,rules:X,...le}=t,{target_rules:Q=[],buy_rules:W=[],...ce}=u,de=[...Q.filter(c=>!!c.disguised),...W.filter(c=>!!c.disguised),...X.filter(c=>!!c.disguised)],J={};for(const c of de)J[c.attribute]=c.field_type==="number"?parseInt(c.values):c.values;const V=c=>c.filter(_=>!_.disguised).map(_=>({operator:_.operator,attribute:_.attribute,values:_.values}));ae({...le,rules:V(X),application_method:{...ce,...J,target_rules:V(Q),buy_rules:V(W)},is_automatic:n==="true"},{onSuccess:({promotion:c})=>{q.success(a("promotions.toasts.promotionCreateSuccess",{code:c.code})),oe(`/promotions/${c.id}`)},onError:c=>{q.error(c.message)}})},async t=>{const{campaign:r,...n}=t||{};!!Object.keys(n||{}).length&&q.error(a("promotions.errors.promotionTabError"))}),R=async t=>{switch(t){case"type":C(r=>({...r,type:"in-progress"})),v(t);break;case"promotion":C(r=>({...r,type:"completed",promotion:"in-progress"})),v(t);break;case"campaign":{if(!await s.trigger()){C({type:"completed",promotion:"in-progress",campaign:"not-started"}),v("promotion");break}C(n=>({...n,promotion:"completed",campaign:"in-progress"})),v(t);break}}},ie=async()=>{switch(x){case"type":R("promotion");break;case"promotion":{await s.trigger()&&R("campaign");break}}},D=g({control:s.control,name:"template_id"}),l=j.useMemo(()=>{const t=P.find(r=>r.id===D);if(t){L({...te,template_id:D});for(const[r,n]of Object.entries(t.defaults))if(typeof n=="object")for(const[p,u]of Object.entries(n))m(`application_method.${p}`,u);else m(r,n);return t}},[D,m,L]),N=g({control:s.control,name:"application_method.type"})==="fixed",S=g({control:s.control,name:"application_method.allocation"});j.useEffect(()=>{S==="across"&&m("application_method.max_quantity",null)},[S,m]);const T=g({control:s.control,name:"type"})==="standard",re=g({control:s.control,name:"application_method.target_type"})==="order",K=s.getValues();let H={};N&&K.application_method.currency_code&&(H={budget:{currency_code:K.application_method.currency_code}});const{campaigns:ne}=xe(H),w=g({control:s.control,name:"campaign_choice"});j.useEffect(()=>{var r,n;const t=k();w!=="existing"&&m("campaign_id",void 0),w!=="new"&&m("campaign",void 0),w==="new"&&(!t.campaign||!((n=(r=t.campaign)==null?void 0:r.budget)!=null&&n.type))&&m("campaign",{...Z,budget:{...Z.budget,currency_code:t.application_method.currency_code}})},[w,k,m]);const O=g({control:s.control,name:"rules"}).find(t=>t.attribute==="currency_code");if(O){const r=s.getValues().application_method.currency_code,n=O.values;!Array.isArray(n)&&r!==n&&s.setValue("application_method.currency_code",n)}return e.jsx(y.Form,{form:s,children:e.jsxs(ve,{className:"flex h-full flex-col",onSubmit:se,children:[e.jsxs(f,{value:x,onValueChange:t=>R(t),className:"flex h-full flex-col overflow-hidden",children:[e.jsx(y.Header,{children:e.jsx("div",{className:"flex w-full items-center justify-between gap-x-4",children:e.jsx("div",{className:"-my-2 w-full max-w-[600px] border-l",children:e.jsxs(f.List,{className:"grid w-full grid-cols-3",children:[e.jsx(f.Trigger,{className:"w-full",value:"type",status:F.type,children:a("promotions.tabs.template")}),e.jsx(f.Trigger,{className:"w-full",value:"promotion",status:F.promotion,children:a("promotions.tabs.details")}),e.jsx(f.Trigger,{className:"w-full",value:"campaign",status:F.campaign,children:a("promotions.tabs.campaign")})]})})})}),e.jsxs(y.Body,{className:"size-full overflow-hidden",children:[e.jsx(f.Content,{value:"type",className:"size-full overflow-y-auto",children:e.jsx("div",{className:"flex size-full flex-col items-center",children:e.jsx("div",{className:"w-full max-w-[720px] py-16",children:e.jsx(o.Field,{control:s.control,name:"template_id",render:({field:t})=>e.jsxs(o.Item,{children:[e.jsx(o.Label,{children:a("promotions.fields.type")}),e.jsx(o.Control,{children:e.jsx(d,{className:"flex-col gap-y-3",...t,onValueChange:t.onChange,children:P.map(r=>e.jsx(d.ChoiceBox,{value:r.id,label:r.title,description:r.description},r.id))},"template_id")}),e.jsx(o.ErrorMessage,{})]})})})})}),e.jsx(f.Content,{value:"promotion",className:"size-full overflow-y-auto",children:e.jsx("div",{className:"flex size-full flex-col items-center",children:e.jsxs("div",{className:"flex w-full max-w-[720px] flex-col gap-y-8 py-16",children:[e.jsxs(ge,{level:"h1",className:"text-fg-base",children:[a("promotions.sections.details"),(l==null?void 0:l.title)&&e.jsx(ye,{className:"ml-2 align-middle",color:"grey",size:"2xsmall",rounded:"full",children:l==null?void 0:l.title})]}),s.formState.errors.root&&e.jsx(Ne,{variant:"error",dismissible:!1,className:"text-balance",children:s.formState.errors.root.message}),e.jsx(o.Field,{control:s.control,name:"is_automatic",render:({field:t})=>e.jsxs(o.Item,{children:[e.jsx(o.Label,{children:a("promotions.form.method.label")}),e.jsx(o.Control,{children:e.jsxs(d,{className:"flex gap-y-3",...t,value:t.value,onValueChange:t.onChange,children:[e.jsx(d.ChoiceBox,{value:"false",label:a("promotions.form.method.code.title"),description:a("promotions.form.method.code.description"),className:h("basis-1/2")}),e.jsx(d.ChoiceBox,{value:"true",label:a("promotions.form.method.automatic.title"),description:a("promotions.form.method.automatic.description"),className:h("basis-1/2")})]})}),e.jsx(o.ErrorMessage,{})]})}),e.jsx("div",{className:"flex gap-y-4",children:e.jsx(o.Field,{control:s.control,name:"code",render:({field:t})=>e.jsxs(o.Item,{className:"basis-1/2",children:[e.jsx(o.Label,{children:a("promotions.form.code.title")}),e.jsx(o.Control,{children:e.jsx(ee,{...t,placeholder:"SUMMER15"})}),e.jsx(A,{size:"small",leading:"compact",className:"text-ui-fg-subtle",children:e.jsx(z,{t:a,i18nKey:"promotions.form.code.description",components:[e.jsx("br",{},"break")]})})]})})}),!((U=l==null?void 0:l.hiddenFields)!=null&&U.includes("type"))&&e.jsx(o.Field,{control:s.control,name:"type",render:({field:t})=>e.jsxs(o.Item,{children:[e.jsx(o.Label,{children:a("promotions.fields.type")}),e.jsx(o.Control,{children:e.jsxs(d,{className:"flex gap-y-3",...t,onValueChange:t.onChange,children:[e.jsx(d.ChoiceBox,{value:"standard",label:a("promotions.form.type.standard.title"),description:a("promotions.form.type.standard.description"),className:h("basis-1/2")}),e.jsx(d.ChoiceBox,{value:"buyget",label:a("promotions.form.type.buyget.title"),description:a("promotions.form.type.buyget.description"),className:h("basis-1/2")})]})}),e.jsx(o.ErrorMessage,{})]})}),e.jsx(B,{}),e.jsx(I,{form:s,ruleType:"rules"}),e.jsx(B,{}),!(($=l==null?void 0:l.hiddenFields)!=null&&$.includes("application_method.type"))&&e.jsx(o.Field,{control:s.control,name:"application_method.type",render:({field:t})=>e.jsxs(o.Item,{children:[e.jsx(o.Label,{children:a("promotions.fields.value_type")}),e.jsx(o.Control,{children:e.jsxs(d,{className:"flex gap-y-3",...t,onValueChange:t.onChange,children:[e.jsx(d.ChoiceBox,{value:"fixed",label:a("promotions.form.value_type.fixed.title"),description:a("promotions.form.value_type.fixed.description"),className:h("basis-1/2")}),e.jsx(d.ChoiceBox,{value:"percentage",label:a("promotions.form.value_type.percentage.title"),description:a("promotions.form.value_type.percentage.description"),className:h("basis-1/2")})]})}),e.jsx(o.ErrorMessage,{})]})}),e.jsxs("div",{className:"flex gap-x-2 gap-y-4",children:[!((G=l==null?void 0:l.hiddenFields)!=null&&G.includes("application_method.value"))&&e.jsx(o.Field,{control:s.control,name:"application_method.value",render:({field:{onChange:t,value:r,...n}})=>{const p=s.getValues().application_method.currency_code;return e.jsxs(o.Item,{className:"basis-1/2",children:[e.jsx(o.Label,{tooltip:p||!N?void 0:a("promotions.fields.amount.tooltip"),children:a("promotions.form.value.title")}),e.jsx(o.Control,{children:N?e.jsx(we,{...n,min:0,onValueChange:u=>{t(u?parseInt(u):"")},code:p||"USD",symbol:p?be(p):"$",value:r,disabled:!p}):e.jsx(_e,{className:"text-right",min:0,max:100,...n,value:r,onChange:u=>{t(u.target.value===""?null:parseInt(u.target.value))}},"amount")}),e.jsx(A,{size:"small",leading:"compact",className:"text-ui-fg-subtle",children:e.jsx(z,{t:a,i18nKey:N?"promotions.form.value_type.fixed.description":"promotions.form.value_type.percentage.description",components:[e.jsx("br",{},"break")]})}),e.jsx(o.ErrorMessage,{})]})}}),T&&S==="each"&&e.jsx(o.Field,{control:s.control,name:"application_method.max_quantity",render:({field:t})=>e.jsxs(o.Item,{className:"basis-1/2",children:[e.jsx(o.Label,{children:a("promotions.form.max_quantity.title")}),e.jsx(o.Control,{children:e.jsx(ee,{...s.register("application_method.max_quantity",{valueAsNumber:!0}),type:"number",min:1,placeholder:"3"})}),e.jsx(A,{size:"small",leading:"compact",className:"text-ui-fg-subtle",children:e.jsx(z,{t:a,i18nKey:"promotions.form.max_quantity.description",components:[e.jsx("br",{},"break")]})})]})})]}),T&&!((Y=l==null?void 0:l.hiddenFields)!=null&&Y.includes("application_method.allocation"))&&e.jsx(o.Field,{control:s.control,name:"application_method.allocation",render:({field:t})=>e.jsxs(o.Item,{children:[e.jsx(o.Label,{children:a("promotions.fields.allocation")}),e.jsx(o.Control,{children:e.jsxs(d,{className:"flex gap-y-3",...t,onValueChange:t.onChange,children:[e.jsx(d.ChoiceBox,{value:"each",label:a("promotions.form.allocation.each.title"),description:a("promotions.form.allocation.each.description"),className:h("basis-1/2")}),e.jsx(d.ChoiceBox,{value:"across",label:a("promotions.form.allocation.across.title"),description:a("promotions.form.allocation.across.description"),className:h("basis-1/2")})]})}),e.jsx(o.ErrorMessage,{})]})}),!T&&e.jsx(e.Fragment,{children:e.jsx(I,{form:s,ruleType:"buy-rules",scope:"application_method.buy_rules"})}),!re&&e.jsxs(e.Fragment,{children:[e.jsx(B,{}),e.jsx(I,{form:s,ruleType:"target-rules",scope:"application_method.target_rules"})]})]})})}),e.jsx(f.Content,{value:"campaign",className:"size-full overflow-auto",children:e.jsx("div",{className:"flex flex-col items-center",children:e.jsx("div",{className:"flex w-full max-w-[720px] flex-col gap-y-8 py-16",children:e.jsx(je,{form:s,campaigns:ne||[]})})})})]})]}),e.jsx(y.Footer,{children:e.jsxs("div",{className:"flex items-center justify-end gap-x-2",children:[e.jsx(y.Close,{asChild:!0,children:e.jsx(E,{variant:"secondary",size:"small",children:a("actions.cancel")})}),x==="campaign"?e.jsx(E,{type:"submit",size:"small",isLoading:!1,children:a("actions.save")},"save-btn"):e.jsx(E,{type:"button",onClick:ie,size:"small",children:a("actions.continue")},"continue-btn")]})})]})})},nt=()=>e.jsx(y,{children:e.jsx(Re,{})});export{nt as Component};
