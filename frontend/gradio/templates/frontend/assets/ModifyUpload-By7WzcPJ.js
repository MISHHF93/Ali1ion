import{I as p,C as E}from"./Index-D21IHG0c.js";import{D as j}from"./Download-DVtk-Jv3.js";import{U as z}from"./Undo-CpmTQw3B.js";import{D as P}from"./DownloadLink-BgAM71ly.js";/* empty css                                                   */const{SvelteComponent:A,append:F,attr:m,detach:G,init:H,insert:J,noop:k,safe_not_equal:K,svg_element:q}=window.__gradio__svelte__internal;function N(o){let e,n;return{c(){e=q("svg"),n=q("path"),m(n,"d","M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"),m(e,"xmlns","http://www.w3.org/2000/svg"),m(e,"width","100%"),m(e,"height","100%"),m(e,"viewBox","0 0 24 24"),m(e,"fill","none"),m(e,"stroke","currentColor"),m(e,"stroke-width","1.5"),m(e,"stroke-linecap","round"),m(e,"stroke-linejoin","round"),m(e,"class","feather feather-edit-2")},m(t,l){J(t,e,l),F(e,n)},p:k,i:k,o:k,d(t){t&&G(e)}}}class O extends A{constructor(e){super(),H(this,e,null,N,K,{})}}const{SvelteComponent:Q,append:v,attr:R,check_outros:C,create_component:$,destroy_component:h,detach:T,element:V,flush:g,group_outros:I,init:W,insert:X,mount_component:w,safe_not_equal:Y,set_style:L,space:D,toggle_class:M,transition_in:f,transition_out:_}=window.__gradio__svelte__internal,{createEventDispatcher:Z}=window.__gradio__svelte__internal;function S(o){let e,n;return e=new p({props:{Icon:O,label:o[4]("common.edit")}}),e.$on("click",o[6]),{c(){$(e.$$.fragment)},m(t,l){w(e,t,l),n=!0},p(t,l){const i={};l&16&&(i.label=t[4]("common.edit")),e.$set(i)},i(t){n||(f(e.$$.fragment,t),n=!0)},o(t){_(e.$$.fragment,t),n=!1},d(t){h(e,t)}}}function U(o){let e,n;return e=new p({props:{Icon:z,label:o[4]("common.undo")}}),e.$on("click",o[7]),{c(){$(e.$$.fragment)},m(t,l){w(e,t,l),n=!0},p(t,l){const i={};l&16&&(i.label=t[4]("common.undo")),e.$set(i)},i(t){n||(f(e.$$.fragment,t),n=!0)},o(t){_(e.$$.fragment,t),n=!1},d(t){h(e,t)}}}function B(o){let e,n;return e=new P({props:{href:o[2],download:!0,$$slots:{default:[y]},$$scope:{ctx:o}}}),{c(){$(e.$$.fragment)},m(t,l){w(e,t,l),n=!0},p(t,l){const i={};l&4&&(i.href=t[2]),l&528&&(i.$$scope={dirty:l,ctx:t}),e.$set(i)},i(t){n||(f(e.$$.fragment,t),n=!0)},o(t){_(e.$$.fragment,t),n=!1},d(t){h(e,t)}}}function y(o){let e,n;return e=new p({props:{Icon:j,label:o[4]("common.download")}}),{c(){$(e.$$.fragment)},m(t,l){w(e,t,l),n=!0},p(t,l){const i={};l&16&&(i.label=t[4]("common.download")),e.$set(i)},i(t){n||(f(e.$$.fragment,t),n=!0)},o(t){_(e.$$.fragment,t),n=!1},d(t){h(e,t)}}}function x(o){let e,n,t,l,i,b,r=o[0]&&S(o),a=o[1]&&U(o),c=o[2]&&B(o);return i=new p({props:{Icon:E,label:o[4]("common.clear")}}),i.$on("click",o[8]),{c(){e=V("div"),r&&r.c(),n=D(),a&&a.c(),t=D(),c&&c.c(),l=D(),$(i.$$.fragment),R(e,"class","svelte-19sk1im"),M(e,"not-absolute",!o[3]),L(e,"position",o[3]?"absolute":"static")},m(s,d){X(s,e,d),r&&r.m(e,null),v(e,n),a&&a.m(e,null),v(e,t),c&&c.m(e,null),v(e,l),w(i,e,null),b=!0},p(s,[d]){s[0]?r?(r.p(s,d),d&1&&f(r,1)):(r=S(s),r.c(),f(r,1),r.m(e,n)):r&&(I(),_(r,1,1,()=>{r=null}),C()),s[1]?a?(a.p(s,d),d&2&&f(a,1)):(a=U(s),a.c(),f(a,1),a.m(e,t)):a&&(I(),_(a,1,1,()=>{a=null}),C()),s[2]?c?(c.p(s,d),d&4&&f(c,1)):(c=B(s),c.c(),f(c,1),c.m(e,l)):c&&(I(),_(c,1,1,()=>{c=null}),C());const u={};d&16&&(u.label=s[4]("common.clear")),i.$set(u),(!b||d&8)&&M(e,"not-absolute",!s[3]),d&8&&L(e,"position",s[3]?"absolute":"static")},i(s){b||(f(r),f(a),f(c),f(i.$$.fragment,s),b=!0)},o(s){_(r),_(a),_(c),_(i.$$.fragment,s),b=!1},d(s){s&&T(e),r&&r.d(),a&&a.d(),c&&c.d(),h(i)}}}function ee(o,e,n){let{editable:t=!1}=e,{undoable:l=!1}=e,{download:i=null}=e,{absolute:b=!0}=e,{i18n:r}=e;const a=Z(),c=()=>a("edit"),s=()=>a("undo"),d=u=>{a("clear"),u.stopPropagation()};return o.$$set=u=>{"editable"in u&&n(0,t=u.editable),"undoable"in u&&n(1,l=u.undoable),"download"in u&&n(2,i=u.download),"absolute"in u&&n(3,b=u.absolute),"i18n"in u&&n(4,r=u.i18n)},[t,l,i,b,r,a,c,s,d]}class ae extends Q{constructor(e){super(),W(this,e,ee,x,Y,{editable:0,undoable:1,download:2,absolute:3,i18n:4})}get editable(){return this.$$.ctx[0]}set editable(e){this.$$set({editable:e}),g()}get undoable(){return this.$$.ctx[1]}set undoable(e){this.$$set({undoable:e}),g()}get download(){return this.$$.ctx[2]}set download(e){this.$$set({download:e}),g()}get absolute(){return this.$$.ctx[3]}set absolute(e){this.$$set({absolute:e}),g()}get i18n(){return this.$$.ctx[4]}set i18n(e){this.$$set({i18n:e}),g()}}export{ae as M};
//# sourceMappingURL=ModifyUpload-By7WzcPJ.js.map
