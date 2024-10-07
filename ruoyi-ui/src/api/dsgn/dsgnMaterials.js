import request from '@/utils/request'

// 查询材料列表
export function listDsgnMaterials(query) {
  return request({
    url: '/dsgn/dsgnMaterials/list',
    method: 'get',
    params: query
  })
}

// 查询材料详细
export function getDsgnMaterials(id) {
  return request({
    url: '/dsgn/dsgnMaterials/' + id,
    method: 'get'
  })
}

// 新增材料
export function addDsgnMaterials(data) {
  return request({
    url: '/dsgn/dsgnMaterials',
    method: 'post',
    data: data
  })
}

// 修改材料
export function updateDsgnMaterials(data) {
  return request({
    url: '/dsgn/dsgnMaterials',
    method: 'put',
    data: data
  })
}

// 删除材料
export function delDsgnMaterials(id) {
  return request({
    url: '/dsgn/dsgnMaterials/' + id,
    method: 'delete'
  })
}
