<template>
	<div>
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
                       
						<!--~~~~~~~ TABLE ONE ~~~~~~~~~-->
                        <div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20">
                           <template>
                                <div class="demo-upload-list" v-for="(item,index) in uploadList" :key="index">
                                   
                                        <img :src="item.url">
                                        <div class="demo-upload-list-cover">
                                            <Icon type="ios-eye-outline" @click.native="handleView(item,index)"></Icon>
                                            <Icon type="ios-trash-outline" @click.native="handleRemove(item,index)"></Icon>
                                        </div>
                                    
                                   
                                </div>
                                <Upload
                                    ref="upload"
                                    :show-upload-list="false"
                                    :default-file-list="defaultList"
                                    :on-success="handleSuccess"
                                    :format="['jpg','jpeg','png']"
                                    :max-size="2048"
                                    :on-format-error="handleFormatError"
                                    :on-exceeded-size="handleMaxSize"
                                    :before-upload="handleBeforeUpload"
                                    multiple
                                    type="drag"
                                    action="/app/upload-review-file"
                                    style="display: inline-block;width:58px;">
                                    <div style="width: 58px;height:58px;line-height: 58px;">
                                        <Icon type="ios-camera" size="20"></Icon>
                                    </div>
                                </Upload>
                                <Modal title="View Image" v-model="visible">
                                    <img :src="imgName" v-if="visible" style="width: 100%">
                                </Modal>
                            </template>
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
			defaultList: [],
                imgName: '',
                visible: false,
                uploadList: []
		}
	},
    methods:{
    
        handleView (item,index) {
            this.imgName = item.url;
            this.visible = true;
        },
        async handleRemove (item,index) {
            const res = await this.callApi('delete','/app/legend_images', {id:item.id})
            if(res.status == 200){
                 this.uploadList.splice(index,1)
                 this.i("image deleted !")
            }
            else{
                this.swr()
            }
           
        },
        handleSuccess (res, file) {
            console.log(res)
            // let ob = {
            //     url:res.file
            // }
             this.uploadList.push(res)
        },
        handleFormatError (file) {
            this.$Notice.warning({
                title: 'The file format is incorrect',
                desc: 'File format of ' + file.name + ' is incorrect, please select jpg or png.'
            });
        },
        handleMaxSize (file) {
            this.$Notice.warning({
                title: 'Exceeding file size limit',
                desc: 'File  ' + file.name + ' is too large, no more than 2M.'
            });
        },
        handleBeforeUpload () {
            const check = this.uploadList.length < 10;
            if (!check) {
                this.$Notice.warning({
                    title: 'Up to five pictures can be uploaded.'
                });
            }
            return check;
        }
    },
    
    async created(){
        const res = await this.callApi('get','/app/legend_images')
		if( res.status == 200){
			this.uploadList = res.data
		} else {
			this.swr()
		}
		this.isLoading = false
	},
}
</script>
<style>
    .demo-upload-list{
        display: inline-block;
        width: 60px;
        height: 60px;
        text-align: center;
        line-height: 60px;
        border: 1px solid transparent;
        border-radius: 4px;
        overflow: hidden;
        background: #fff;
        position: relative;
        box-shadow: 0 1px 1px rgba(0,0,0,.2);
        margin-right: 4px;
    }
    .demo-upload-list img{
        width: 100%;
        height: 100%;
    }
    .demo-upload-list-cover{
        display: none;
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0,0,0,.6);
    }
    .demo-upload-list:hover .demo-upload-list-cover{
        display: block;
    }
    .demo-upload-list-cover i{
        color: #fff;
        font-size: 20px;
        cursor: pointer;
        margin: 0 2px;
    }
</style>



