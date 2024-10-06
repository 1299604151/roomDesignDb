import request from '@/utils/request'

// 查询设计方案-材料关联列表
export function listMaterials(query) {
  return request({
    url: '/system/materials/list',
    method: 'get',
    params: query
  })
}

// 查询设计方案-材料关联详细
export function getMaterials(id) {
  return request({
    url: '/system/materials/' + id,
    method: 'get'
  })
}

// 新增设计方案-材料关联
export function addMaterials(data) {
  return request({
    url: '/system/materials',
    method: 'post',
    data: data
  })
}

// 修改设计方案-材料关联
export function updateMaterials(data) {
  return request({
    url: '/system/materials',
    method: 'put',
    data: data
  })
}

// 删除设计方案-材料关联
export function delMaterials(id) {
  return request({
    url: '/system/materials/' + id,
    method: 'delete'
  })
}
