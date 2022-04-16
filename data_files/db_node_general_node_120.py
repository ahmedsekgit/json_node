==============================
 "react native" component dynamic children props  
==============================
const the_children = () => (<Text>Hello</Text>) ... <Component children={the_children}></Component> ... export const Component = ({ children }) => {     return (         <View> {!!children && children()} </View>     ); };
  
==============================
120 at  2021-10-29T15:22:52.000Z
==============================
