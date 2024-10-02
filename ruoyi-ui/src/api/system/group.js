import request from '@/utils/request'

// 查询学习小组信息列表
export function listGroup(query) {
  return request({
    url: '/system/group/list',
    method: 'get',
    params: query
  })
}
export function listGroupAll() {
  return request({
    url: '/system/group/listAll',
    method: 'get'
  })
}

// 查询学习小组信息详细
export function getGroup(id) {
  return request({
    url: '/system/group/' + id,
    method: 'get'
  })
}

// 新增学习小组信息
export function addGroup(data) {
  return request({
    url: '/system/group',
    method: 'post',
    data: data
  })
}

// 修改学习小组信息
export function updateGroup(data) {
  return request({
    url: '/system/group',
    method: 'put',
    data: data
  })
}

// 删除学习小组信息
export function delGroup(id) {
  return request({
    url: '/system/group/' + id,
    method: 'delete'
  })
}
