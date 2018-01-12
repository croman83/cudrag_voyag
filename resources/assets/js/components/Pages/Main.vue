<template>
    <div>
        main
        <lang></lang>
    </div>
</template>

<script>
    import Lang from './../Elements/Lang.vue';
    export default {
        mounted() {
            console.log('MainPage mounted.')
        },
        components:{
          Lang
        },
        head:{
            title:{
                inner: 'Decor CuDrag',
                separator:' ',
            },
            meta: [
                { name: 'application-name', content: 'CuDrag' }
                ]
        },
    }
</script>
