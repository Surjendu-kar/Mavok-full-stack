import{ct as o,s as n,d8 as i}from"./index-BxRPZUbt.js";var u="workflow_executions",s=i(u),w=(e,t)=>{const{data:r,...a}=o({queryFn:()=>n.admin.workflowExecution.list(e),queryKey:s.list(e),...t});return{...r,...a}},T=(e,t)=>{const{data:r,...a}=o({queryFn:()=>n.admin.workflowExecution.retrieve(e),queryKey:s.detail(e),...t});return{...r,...a}},d=["compensating","invoking"],_=["skipped","skipped_failure"],l=["done"],f=["failed","reverted","timeout","dormant"],v=["not_started"],c=["failed","reverted"],E=["invoking","waiting_to_compensate","compensating"],k=e=>{let t="green";return c.includes(e)&&(t="red"),E.includes(e)&&(t="orange"),t},g=(e,t)=>{switch(t){case"done":return e("workflowExecutions.state.done");case"failed":return e("workflowExecutions.state.failed");case"reverted":return e("workflowExecutions.state.reverted");case"invoking":return e("workflowExecutions.state.invoking");case"waiting_to_compensate":return e("workflowExecutions.transaction.state.waitingToCompensate");case"compensating":return e("workflowExecutions.state.compensating");case"not_started":return e("workflowExecutions.state.notStarted")}};export{_ as S,g as a,T as b,l as c,d,f as e,v as f,k as g,w as u,s as w};
