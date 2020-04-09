<template>
	<div>
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!--~~~~~~~ TABLE ONE ~~~~~~~~~-->
            <div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20">
                <div class="_overflow _table_div">
                    <table class="_table">
                        <tr>
                            <th>Num</th>
                            <th>Total Profile Views</th>
                            <th>Total Contact Clicked</th>
                        </tr>
                            <!-- ITEMS -->
                        <tr >
                            <template >
                                <td>{{data.id}}</td>
                                <td>{{data.views}}</td>
                                <td>{{data.contact_views}}</td>
                            </template>
                        </tr>
                    </table>
                </div>
            </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
export default {
    data(){
		return{
			data:[],
			
		}
	},
    methods:{
        
    },
    
    async created(){
        const res = await this.callApi('get','/app/user')
		if( res.status == 200){
			this.data = res.data
		} else {
			// this.swr()
		}
		this.isLoading = false
	},
}
</script>



